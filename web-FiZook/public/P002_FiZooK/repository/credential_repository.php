<?php
require_once('../model/response.php');
require_once('../model/user.php');
require_once('../model/credential.php');
require_once ('user_service.php');
require_once ('../model/authBag.php');
require_once ('../repository/user_repository.php');
require_once ('../repository/usersubjectclass_repository.php');
require_once ('../repository/role_repository.php');
require_once ('../repository/permission_repository.php');
require_once ('../repository/rolepermission_repository.php');

class CredentialRepository
{
    public $db;
    public $userRepository;

    function __construct($conn)
    {
        $this->db = $conn;
        $this->userRepository = new UserRepository($this->db);
    }

    //CREATE 
    function create($credential)
    {
        $response = new Response();

        try {
            if (!$credential instanceof Credential) {
                throw new Exception("The instance must be a credential", -1);
            }

            $hash = password_hash($credential->password, PASSWORD_BCRYPT);
            $sql = 'INSERT INTO Credentials (UserId, OAuthProvider, UserName, Password, OAuthUid) VALUES (' . $credential->userId . ', "' . $credential->oauthProvider . '","' . $credential->username . '","' . $hash . ($credential->oauthUid == null ? '")' : '","' . $credential->oauthUid . '")');
            $result = $this->db->exec($sql);

            if ($result == 1) {
                $response->result = true;
            } else {
                $response->result = false;
                $this->userRepository->delete($credential->userId);
            }

        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }

    //READ
    function read($id)
    {
        $response = new Response();

        try {
            $sql = 'SELECT * FROM Credentials ' . ($id == null ? '' : 'WHERE Id = ' . $id);
            if ($id == null) {
                $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            } else {
                $result = $this->db->query($sql)->fetch(PDO::FETCH_ASSOC);
            }

            $response->result = $result;
            $response->code = 200;

        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }

    function readByUsername($username)
    {
        $response = new Response();

        try {
            $sql = 'SELECT * FROM Credentials WHERE `Username` = "' . $username . '"';
            $result = $this->db->query($sql)->fetch(PDO::FETCH_ASSOC);

            $response->result = $result;
            $response->code = 200;

        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }

    function login($credential) : Response{
        $response = new Response();
        $authBag = new AuthBag();
        $authBag->isAuthenticated = false;

        try {
            $sql = 'SELECT * FROM Credentials WHERE OAuthProvider = "'. $credential->oauthProvider .'" AND Username = "'. $credential->username .'" AND OAuthUid = "'. $credential->oauthUid .'"';
            $currentCredential = $this->db->query($sql)->fetch(PDO::FETCH_ASSOC);

            if ($currentCredential != false) {
                $oauthUid =  $currentCredential['OAuthUid'];
                $authBag->oauthUid = $oauthUid;

                //user
                $userRepository = new UserRepository($this->db);
                $userResponse = $userRepository->read($currentCredential['UserId']);

                if(isset($userResponse->result) && $userResponse->hasError == false){
                    $user = $userResponse->result;
                    $authBag->user = $user;

                    //classes
                    $uscRepository = new UserSubjectClassRepository($this->db);
                    $classes = $uscRepository->getClassesByUser($user['Id']);
                    $authBag->classes = $classes;

                    //role
                    $roleRepository = new RoleRepository($this->db);
                    $roleResponse = $roleRepository->read($user['RoleId']);

                    if(isset($roleResponse->result) && $roleResponse->hasError == false){
                        $role = $roleResponse->result;
                        $authBag->role = $role;

                        //permissions
                        $sql = 'SELECT P.`Name` FROM RolesPermissions AS RP
                                            INNER JOIN Permissions AS P
                                                ON RP.PermissionId = P.Id
                                            WHERE RP.RoleId = '. $role['Id'];
                        $permissionResponse = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);

                        if(isset($permissionResponse)){
                            $permissions = array();
                            foreach ($permissionResponse as $key => $value) {
                                $permissions[] = $value['Name'];
                            }
                            $authBag->permissions = $permissions;
                        }
                    }
                }

                $authBag->isAuthenticated = true;
                $response->result = $authBag;
                $response->code = 200;
            } else {
                $response->result = $authBag;
                $response->code = 404;
                $response->hasError = true;
            }

        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }

    function registration($credential, $user, $classId) : Response {
        $response = new Response();
        $credentialRepository = new CredentialRepository($this->db);
        $userSubjectClassRepository = new UserSubjectClassRepository($this->db);

        try {
            $sql = 'SELECT * FROM Credentials WHERE OAuthProvider = "'. $credential->oauthProvider .'" AND Username = "'. $credential->username .'" AND OAuthUid = "'. $credential->oauthUid .'"';
            $currentCredential = $this->db->query($sql)->fetch(PDO::FETCH_ASSOC);

            if ($currentCredential == false) {
                $userRepository = new UserRepository($this->db);

                switch ($user->userType) {
                    case 'Student':
                        $user->roleId = 1;
                        break;

                    case 'Teacher':
                        $user->roleId = 2;
                        break;
                        
                    case 'Technician':
                        $user->roleId = 3;
                        break;
                        
                    case 'Accounting':
                        $user->roleId = 2;
                        break;
                }

                $createdUser = $userRepository->readByEmail($user->email);
                if($createdUser->result == false){
                    $createdUser = $userRepository->createAndRead($user);

                    if ($classId != null && $createdUser->result != false) {
                        $createdUserId = $createdUser->result['Id'];
                        $userSubjectClassRepository->create($createdUserId, null, $classId);
                    }
                }

                if ($createdUser->result != false) {
                    if ($createdUser->result['Photo'] == null) {
                        $sql = 'UPDATE Users SET Photo = "' . $user->photo . '" WHERE Id = ' . $createdUser->result['Id'];
                        $this->db->exec($sql);
                    }

                    $result = $createdUser->result;
                    $credential->userId = $result['Id'];
                    $credential->password = $credential->oauthUid;
                    $credentialResponse = $credentialRepository->create($credential);

                    if ($credentialResponse->result == true) {
                        $response->result = true;
                        $response->code = 200;
                        $response->hasError = false;
                    } else {
                        $response->result = false;
                        $response->code = 500;
                        $response->hasError = true;
                    }
                } else {
                    $response->result = false;
                    $response->code = 500;
                    $response->hasError = true;
                }

            } else {
                $response->result = false;
                $response->code = 400;
                $response->hasError = true;
            }
        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        //else di tutto false

        return $response;
    }

    //UPDATE
    function update($credential)
    {
        $response = new Response();

        try {
            if (!$credential instanceof Credential) {
                throw new Exception("The instance must be an activity", -1);
            }

            $hash = password_hash($credential->password, PASSWORD_BCRYPT);

            $sql = 'UPDATE Credentials 
                    SET UserId = ' . $credential->userId . ', OAuthProvider = "' . $credential->oauthProvider . '", Username = "' . $credential->username . '", Password = "' . $hash . ($credential->oauthUid == null ? '"' : '", OAuthUid = "' . $credential->oauthUid . '"') . '
                WHERE Id = '. $credential->id;
            $result = $this->db->exec($sql);

            if ($result == 1) {
                $response->result = true;
            } else {
                $response->result = false;
            }
        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }

    //DELETE
    function delete($id)
    {
        $response = new Response();

        try {
            $sql = 'DELETE FROM Credentials WHERE Id = ' . $id;
            $result = $this->db->exec($sql);

            if ($result == 1) {
                $response->result = true;
            } else {
                $response->result = false;
            }
        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }
}

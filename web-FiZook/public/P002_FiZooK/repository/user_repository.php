<?php
require_once('../model/response.php');

class UserRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE
    function create($user)
    {
        $response = new Response();

        try {
            if (!$user instanceof User) {
                throw new Exception("The instance must be a user", -1);
            }

            $sql = 'INSERT INTO Users (FirstName, LastName, Email, UserType, RoleId, Photo) VALUES ("' . $user->firstName . '","' . $user->lastName . '","' . $user->email . '", "' . $user->userType . '",' . $user->roleId . ',"' . $user->photo . '")';
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

    //READ
    function read($id)
    {
        $response = new Response();

        try {
            $sql = 'SELECT * FROM Users ' . ($id == null ? '' : 'WHERE Id = ' . $id);
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

    function readByEmail($email)
    {
        $response = new Response();

        try {
            $sql = 'SELECT * FROM Users WHERE `Email` = "' . $email . '"';
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

    function createAndRead($user) {
        $createdUser = $this->create($user);

        if ($createdUser->result == true) {
            return $this->readByEmail($user->email);
        } else {
            return $createdUser;
        }
    }

    //UPDATE
    function update($user)
    {
        $response = new Response();

        try {
            if (!$user instanceof User) {
                throw new Exception("The instance must be a user", -1);
            }

            $sql = 'UPDATE Users 
                    SET FirstName = "' . $user->firstName . '", LastName = "' . $user->lastName . '", Email = "' . $user->email . '", UserType = "' . $user->userType . '", RoleId = ' . $user->roleId  . ($user->photo == null ? '' : ', Photo = "' . $user->photo . '"') . '
                WHERE Id = '. $user->id;
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
            $sql = 'DELETE FROM Users WHERE Id = ' . $id;
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

    function search($type, $filter)
    {
        $response = new Response();

        try {
            $sql = 'SELECT Id AS `Key`, CONCAT(FirstName, " ", LastName) AS `Value` FROM Users WHERE UserType = "' . $type . '" AND LOWER(CONCAT(FirstName, " ", LastName)) LIKE LOWER("%' . $filter . '%")';
            $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);

            $response->result = $result;
            $response->code = 200;

        } catch (\Throwable $th) {
            $response->hasError = true;
            $response->message = $th->getMessage();
            $response->code = $th->getCode();
        }

        return $response;
    }
}

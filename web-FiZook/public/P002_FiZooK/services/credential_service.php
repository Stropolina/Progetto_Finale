<?php
require ('../model/credential.php');
require_once ('../model/user.php');

class CredentialService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new CredentialRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function getByUsername($f3, $params) {
        $db = new Connect();
        $repository = new CredentialRepository($db->conn);

        $results = $repository->readByUsername($f3->get('PARAMS.username'));
        echo json_encode($results);
        $db->disconnect();
    }

    function login($f3, $params) {
        $db = new Connect();
        $repository = new CredentialRepository($db->conn);

        $credential = $this->credentialFromJWT($f3->get('BODY'));
        $authBagResponse = $repository->login(($credential));

        echo json_encode($authBagResponse);
    }

    function registration($f3, $params) {
        $db = new Connect();
        $repository = new CredentialRepository($db->conn);
        $registration = json_decode(json_decode($f3->get('BODY'), true));

        $user = $this->userFromJWT($registration->credential);
        $user->userType = $registration->userType;
        $classId = $registration->classId;
        $credential = $this->credentialFromJWT($registration->credential);
        $response = $repository->registration($credential, $user, $classId);

        echo json_encode($response);
    }

    function credentialFromJWT($jwt) : Credential {
        $credential = new Credential();

        list($header, $payload, $signature) = explode (".", $jwt); 
        $responsePayload = json_decode(base64_decode($payload)); 
 
        if(!empty($responsePayload)){ 
            $credential->oauthProvider = 'Google'; 
            $credential->oauthUid  = !empty($responsePayload->sub)?$responsePayload->sub:'';
            $credential->username = !empty($responsePayload->email)?$responsePayload->email:'';
        }

        return $credential;
    }

    function userFromJWT($jwt) : User {
        $user = new User();

        list($header, $payload, $signature) = explode (".", $jwt); 
        $responsePayload = json_decode(base64_decode($payload)); 
 
        if(!empty($responsePayload)){
            $user->firstName = !empty($responsePayload->given_name)?$responsePayload->given_name:''; 
            $user->lastName  = !empty($responsePayload->family_name)?$responsePayload->family_name:'';
            $user->email = !empty($responsePayload->email)?$responsePayload->email:''; 
            $user->photo = !empty($responsePayload->picture)?$responsePayload->picture:'';
        }

        return $user;
    }

    function post($f3, $params) {
        $db = new Connect();
        $credential = new Credential();
        $repository = new CredentialRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $credential->id = $entity->id;
        $credential->userId = $entity->userId;
        $credential->oauthProvider = $entity->oauthProvider;
        $credential->oauthUid = $entity->oauthUid;
        $credential->username = $entity->username;
        $credential->password = $entity->password;

        $result = $repository->create($credential);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $activity) {
        $db = new Connect();
        $credential = new Credential();
        $repository = new CredentialRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $credential->id = $entity->id;
        $credential->userId = $entity->userId;
        $credential->oauthProvider = $entity->oauthProvider;
        $credential->oauthUid = $entity->oauthUid;
        $credential->username = $entity->username;
        $credential->password = $entity->password;

        $result = $repository->update($credential);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new CredentialRepository($db->conn);

        $id = $f3->get('PARAMS.id');
        
        $result = $repository->delete($id);
        echo json_encode($result);
        $db->disconnect();
    }
}
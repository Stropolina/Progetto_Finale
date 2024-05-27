<?php
require ('../model/user.php');

class UserService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new UserRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function getByEmail($f3, $params) {
        $db = new Connect();
        $repository = new UserRepository($db->conn);

        $results = $repository->readByEmail($f3->get('PARAMS.email'));
        echo json_encode($results);
        $db->disconnect();
    }

    function post($f3, $params) {
        $db = new Connect();
        $user = new User();
        $repository = new UserRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $user->id = $entity->id;
        $user->firstName = $entity->firstName;
        $user->lastName = $entity->lastName;
        $user->email = $entity->email;
        $user->userType = $entity->userType;
        $user->photo = $entity->photo;
        $user->roleId = $entity->roleId;

        $result = $repository->create($user);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $activity) {
        $db = new Connect();
        $user = new User();
        $repository = new UserRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $user->id = $entity->id;
        $user->firstName = $entity->firstName;
        $user->lastName = $entity->lastName;
        $user->email = $entity->email;
        $user->userType = $entity->userType;
        $user->photo = $entity->photo;
        $user->roleId = $entity->roleId;

        $result = $repository->update($user);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new UserRepository($db->conn);

        $id = $f3->get('PARAMS.id');
        
        $result = $repository->delete($id);
        echo json_encode($result);
        $db->disconnect();
    }

    function search($f3, $params) {
        $db = new Connect();
        $repository = new UserRepository($db->conn);

        $type = $f3->get('PARAMS.type');
        $filter = $f3->get('PARAMS.filter');

        $results = $repository->search($type, $filter);
        echo json_encode($results);
        $db->disconnect();
    }
}
<?php
require ('../model/classroom.php');

class ClassService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new ClassRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function post($f3, $params) {
        $db = new Connect();
        $class = new Classroom();
        $repository = new ClassRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $class->id = $entity->id;
        $class->name = $entity->name;

        $result = $repository->create($class);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $params) {
        $db = new Connect();
        $class = new Classroom();
        $repository = new ClassRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $class->id = $entity->id;
        $class->name = $entity->name;

        $result = $repository->update($class);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new ClassRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $result = $repository->delete($id);
        echo json_encode($result);
        $db->disconnect();
    }

    function search($f3, $params) {
        $db = new Connect();
        $repository = new ClassRepository($db->conn);

        $filter = $f3->get('PARAMS.filter');

        $results = $repository->search($filter);
        echo json_encode($results);
        $db->disconnect();
    }
}
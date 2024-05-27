<?php
require ('../model/activity.php');

class ActivityService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new ActivityRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function post($f3, $params) {
        $db = new Connect();
        $activity = new Activity();
        $repository = new ActivityRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $activity->id = $entity->id;
        $activity->name = $entity->name;

        $result = $repository->create($activity);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $activity) {
        $db = new Connect();
        $activity = new Activity();
        $repository = new ActivityRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $activity->id = $entity->id;
        $activity->name = $entity->name;

        $result = $repository->update($activity);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new ActivityRepository($db->conn);

        $id = $f3->get('PARAMS.id');
        
        $result = $repository->delete($id);
        echo json_encode($result);
        $db->disconnect();
    }
}



/* require './connect.php';
require '../repository/subject_repository.php'; */

//Imposta l'accettazione delle chiamate da qualsiasi origine
/* $f3->set('CORS.origin','*'); */

//GET
/* $f3->route(
    'GET /subjects/@id',
    'GET /subjects/',
    function ($f3) {
        $db = new Connect();
        $repository = new SubjectRepository($db->conn);
        $results = $repository->read($f3->get('PARAMS.id'));
        echo json_encode($results);
        $db->disconnect();
    }
); */

/* $f3->route(
    'GET /subjects/',
    function ($f3) {
        $db = new Connect();
        $repository = new SubjectRepository($db->conn);
        $results = $repository->read();
        echo json_encode($results);
        $db->disconnect();
    }
); */

//POST
/* $f3->route(
    'POST /subjects/',
    function ($f3) {
        $db = new Connect();
        $repository = new SubjectRepository($db->conn);
        $data = $f3->get('BODY');
        $json = json_decode($data);
        $result = $repository->create($json);
        echo json_encode($result);
        $db->disconnect();
    }
); */

//PUT

//DELETE

/* $f3->run(); */
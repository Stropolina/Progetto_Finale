<?php
require ('../model/recurrence.php');

class RecurrenceService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new RecurrenceRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function post($f3, $params) {
        $db = new Connect();
        $recurrence = new Recurrence();
        $repository = new RecurrenceRepository($db->conn);
        
        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $recurrence->id = $entity->id;
        $recurrence->recurrence = $entity->recurrence;
        $recurrence->bookingId = $entity->bookingId;

        $result = $repository->create($recurrence);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $params) {
        $db = new Connect();
        $recurrence = new Recurrence();
        $repository = new RecurrenceRepository($db->conn);
        
        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $recurrence->id = $entity->id;
        $recurrence->recurrence = $entity->recurrence;
        $recurrence->bookingId = $entity->bookingId;

        $result = $repository->update($recurrence);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new RecurrenceRepository($db->conn);

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
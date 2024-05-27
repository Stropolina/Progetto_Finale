<?php
require ('../model/subject.php');

class SubjectService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new SubjectRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function post($f3, $params) {
        $db = new Connect();
        $subject = new Subject();
        $repository = new SubjectRepository($db->conn);
        
        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $subject->id = $entity->id;
        $subject->name = $entity->name;

        $result = $repository->create($subject);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $params) {
        $db = new Connect();
        $subject = new Subject();
        $repository = new SubjectRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $subject->id = $entity->id;
        $subject->name = $entity->name;

        $result = $repository->update($subject);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new SubjectRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $result = $repository->delete($id);
        echo json_encode($result);
        $db->disconnect();
    }

    function getSubjectsByUser($f3, $params) {
        $db = new Connect();
        $repository = new UserSubjectClassRepository($db->conn);

        $results = $repository->readSubjectsByUser($f3->get('PARAMS.userId'));
        echo json_encode($results);
        $db->disconnect();
    }
}
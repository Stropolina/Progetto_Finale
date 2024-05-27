<?php
require ('../model/booking.php');
require ('../model/userBooking.php');

class BookingService
{
    function get($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $id = $f3->get('PARAMS.id');

        $results = $repository->read($id);
        echo json_encode($results);
        $db->disconnect();
    }

    function post($f3, $params) {
        $db = new Connect();
        $booking = new Booking();
        $repository = new BookingRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $booking->id = $entity->id;
        $booking->parentId = $entity->parentId;
        $booking->start = $entity->start;
        $booking->end = $entity->end;
        $booking->classId = $entity->class;
        $booking->subjectId = $entity->subject;
        $booking->roomId = $entity->room;
        $booking->activityId = $entity->activity;

        $result = $repository->create($booking);
        echo json_encode($result);
        $db->disconnect();
    }

    function put($f3, $activity) {
        $db = new Connect();
        $booking = new Booking();
        $repository = new BookingRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $booking->id = $entity->id;
        $booking->parentId = $entity->parentId;
        $booking->start = $entity->start;
        $booking->end = $entity->end;
        $booking->classId = $entity->class;
        $booking->subjectId = $entity->subject;
        $booking->roomId = $entity->room;
        $booking->activityId = $entity->activity;

        $result = $repository->update($booking);
        echo json_encode($result);
        $db->disconnect();
    }

    function delete($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $id = $f3->get('PARAMS.id');
        
        $result = $repository->delete($id);
        echo json_encode($result);
        $db->disconnect();
    }

    function postView($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);

        $result = $repository->readByClass($entity);
        echo json_encode($result);
        $db->disconnect();
    }

    function getBookingsByUser($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $data = $f3->get('PARAMS.userId');
        $userId = json_decode($data);

        $result = $repository->readBookingsByUser($userId);
        echo json_encode($result);
        $db->disconnect();
    }

    function postUserBooking($f3, $params) {
        $db = new Connect();
        $userBooking = new UserBooking();
        $repository = new BookingRepository($db->conn);

        $data = $f3->get('BODY');
        $entity = json_decode($data);
        $userBooking->booking = $entity->booking;
        $userBooking->userId = $entity->userId;

        $result = $repository->createForUser($userBooking);
        echo json_encode($result);
        $db->disconnect();
    }

    function deleteUserBooking($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $id = $f3->get('PARAMS.id');
        
        $result = $repository->deleteForUser($id);
        echo json_encode($result);
        $db->disconnect();
    }

    function getByStudent($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $userId = $f3->get('PARAMS.userId');
        $currentDate = $f3->get('PARAMS.currentDate');

        $results = $repository->readBookingByStudent($userId, $currentDate);
        echo json_encode($results);
        $db->disconnect();
    }

    function getByTeacher($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $userId = $f3->get('PARAMS.userId');
        $currentDate = $f3->get('PARAMS.currentDate');

        $results = $repository->readBookingByTeacher($userId, $currentDate);
        echo json_encode($results);
        $db->disconnect();
    }

    function getByClass($f3, $params) {
        $db = new Connect();
        $repository = new BookingRepository($db->conn);

        $classId = $f3->get('PARAMS.classId');
        $currentDate = $f3->get('PARAMS.currentDate');

        $results = $repository->readBookingByClass($classId, $currentDate);
        echo json_encode($results);
        $db->disconnect();
    }
}
<?php
require_once('../model/response.php');

class BookingRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE
    function create($booking)
    {
        $response = new Response();

        try {
            if (!$booking instanceof Booking) {
                throw new Exception("The instance must be a booking", -1);
            }

            $sql = 'INSERT INTO Bookings (' . ($booking->parentId == 0 ? '' : 'ParentId, ') . '`Start`, `End`, ClassId, SubjectId, RoomId, ActivityId) VALUES (' . ($booking->parentId == 0 ? '"' : $booking->parentId . ',"') . $booking->start . '","' . $booking->end . '",' . ($booking->classId == null ? '' : $booking->classId . ',') . ($booking->subjectId == null ? '' : $booking->subjectId . ',') . ($booking->roomId == null ? '' : $booking->roomId . '') .  ($booking->activityId == null ? ')' : ',' . $booking->activityId . ')');
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
            $sql = 'SELECT * FROM Bookings ' . ($id == null ? '' : 'WHERE Id = ' . $id);
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

    //UPDATE
    function update($booking)
    {
        $response = new Response();

        try {
            if (!$booking instanceof Booking) {
                throw new Exception("The instance must be a booking", -1);
            }

            $sql = 'UPDATE Bookings 
                    SET ' . ($booking->parentId == null ? '' : 'ParentId = ' . $booking->parentId . ', ') . 'Start = "' . $booking->start . '", End = "' . $booking->end . '", ' . ($booking->classId == null ? '' : 'ClassId = ' . $booking->classId . ', ') . ($booking->subjectId == null ? '' : 'SubjectId = ' . $booking->subjectId . ', ') . ($booking->roomId == null ? '' : 'RoomId = ' . $booking->roomId . '') . ($booking->activityId == null ? '' : ', ActivityId = ' . $booking->activityId) . '
                WHERE Id = '. $booking->id;
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
            $sql = 'DELETE FROM Bookings WHERE Id = ' . $id;
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

    //READ BY CLASS
    function readByClass($entity)
    {
        $response = new Response();

        try {
            switch ($entity->userType) {
                case 'Student':
                    $sql = 'SELECT * FROM VwBookings WHERE Class = "' . $entity->class . '" AND Start >= "' . $entity->start . '" AND End<= "' . $entity->end . '"';
                    break;
                default:
                    $sql = 'SELECT DISTINCT VB.* FROM vwbookings AS VB
                                INNER JOIN Bookings AS B
                                    ON VB.BookingId = B.Id
                                INNER JOIN UsersSubjectsClasses AS USC
                                    ON B.SubjectId = USC.SubjectId AND B.ClassId = USC.ClassId
                                INNER JOIN Users AS U
                                    ON USC.UserId = U.Id
                                WHERE U.Id = '. $entity->userId .' AND VB.`Start` >= "'. $entity->start .'" AND VB.`End`<= "'. $entity->end .'"
                                ORDER BY VB.`Start`';
                    break;
            }

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

    //READ BY USER
    function readBookingsByUser($userId)
    {
        $response = new Response();

        try {
            $sql = 'SELECT * FROM VwBookings WHERE UserId = ' . $userId;
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

    function createForUser($userBooking) {
        $response = new Response();

        try {
            if (!$userBooking instanceof UserBooking) {
                throw new Exception("The instance must be a UserBooking", -1);
            }

            $booking = $userBooking->booking;
            $userId = $userBooking->userId;

            $sql = 'INSERT INTO Bookings (' . ($booking->parentId == 0 ? '' : 'ParentId, ') . '`Start`, `End`, ClassId, SubjectId, RoomId, ActivityId) VALUES (' . ($booking->parentId == 0 ? '"' : $booking->parentId . ',"') . $booking->start . '","' . $booking->end . '",' . ($booking->class == null ? '' : $booking->class . ',') . ($booking->subject == null ? '' : $booking->subject . ',') . ($booking->room == null ? '' : $booking->room . '') .  ($booking->activity == null ? ')' : ',' . $booking->activity . ');')
                    . 'INSERT INTO UsersBookings (UserId, BookingId) VALUES ('. $userId .', LAST_INSERT_ID());';
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

    //DELETE USERBOOKING
    function deleteForUser($id)
    {
        $response = new Response();

        try {
            $sql = 'DELETE FROM UsersBookings WHERE BookingId = '. $id . '; '  
                    . 'DELETE FROM Bookings WHERE Id = ' . $id;
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

    //READ STUDENT BOOKING
    function readBookingByStudent($userId, $currentDate)
    {
        $response = new Response();

        try {
            $sql = 'SELECT CONCAT(U.FirstName, " ", U.LastName) AS Who, CONCAT(VB.Room, " - ", R.Building) AS `Where`, CONCAT(VB.Subject, " - ", VB.Class) AS What FROM Users AS U
                        INNER JOIN UsersSubjectsClasses AS USC
                            ON U.Id = USC.UserId
                        INNER JOIN Bookings AS B
                            ON B.ClassId = USC.ClassId
                        INNER JOIN vwbookings AS VB
                            ON B.Id = VB.BookingId
                        INNER JOIN Rooms AS R
                            ON R.Id = B.RoomId
                        WHERE USC.UserId = '. $userId .' AND B.`Start` <= "'. $currentDate .'" AND "'. $currentDate .'" <= B.`End`';
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

    //READ TEACHER BOOKING
    function readBookingByTeacher($userId, $currentDate)
    {
        $response = new Response();

        try {
            $sql = 'SELECT CONCAT(U.FirstName, " ", U.LastName) AS Who, CONCAT(VB.Room, " - ", R.Building) AS `Where`, CONCAT(VB.Subject, " - ", VB.Class) AS What FROM Users AS U
                        INNER JOIN UsersSubjectsClasses AS USC
                            ON U.Id = USC.UserId
                        INNER JOIN Bookings AS B
                            ON B.SubjectId = USC.SubjectId AND B.ClassId = USC.ClassId
                        INNER JOIN vwbookings AS VB
                            ON B.Id = VB.BookingId
                        INNER JOIN Rooms AS R
                            ON R.Id = B.RoomId
                        WHERE U.Id = '. $userId .' AND B.`Start` <= "'. $currentDate .'" AND "'. $currentDate .'" <= B.`End`';
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

    //READ CLASS BOOKING
    function readBookingByClass($classId, $currentDate)
    {
        $response = new Response();

        try {
            $sql = 'SELECT CONCAT("Classe ", VB.Class) AS Who, CONCAT(VB.Room, " - ", R.Building) AS `Where`, VB.Subject AS What FROM Bookings AS B
                        INNER JOIN vwbookings AS VB
                            ON B.Id = VB.BookingId
                        INNER JOIN Rooms AS R
                            ON R.Id = B.RoomId
                        WHERE B.ClassId = '. $classId .' AND B.`Start` <= "'. $currentDate .'" AND "'. $currentDate .'" <= B.`End`';
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
}

<?php
class UserBookingRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE 
    function create($userId, $bookingId)
    {
        $sql = 'INSERT INTO UsersBookings (UserId, BookingId) VALUES (' . $userId . ', ' . $bookingId . ')';
        $result = $this->db->query($sql);

        return $result;
    }

    //READ
    function read($id)
    {
        $sql = 'SELECT * FROM UsersBookings '. ($id == null ? '' : 'WHERE Id = ' . $id);
        if ($id == null) {
            $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        } else {
            $result = $this->db->query($sql)->fetch();
        }

        return $result;
    }

    //UPDATE
    function update($id, $userId, $bookingId)
    {
        $sql = 'UPDATE UsersBookings 
                    SET UserId = ' . $userId . ', BookingId = ' . $bookingId . '
                WHERE Id = '. $id;
        $result = $this->db->query($sql);

        return $result;
    }

    //DELETE
    function delete($id)
    {
        $sql = 'DELETE FROM UsersBookings WHERE Id =' . $id;
        $result = $this->db->query($sql);

        return $result;
    }
}

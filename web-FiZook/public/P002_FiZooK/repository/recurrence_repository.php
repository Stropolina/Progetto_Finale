<?php
require_once('../model/response.php');

class RecurrenceRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE 
    function create($recurrence)
    {
        $response = new Response();

        try {
            if (!$recurrence instanceof Recurrence) {
                throw new Exception("The instance must be a recurrence", -1);
            }

            $sql = 'INSERT INTO Recurrences (Recurrence, BookingId) VALUES ("' . $recurrence->recurrence . '", ' . $recurrence->bookingId . ')';
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
            $sql = 'SELECT * FROM Recurrences ' . ($id == null ? '' : 'WHERE Id = ' . $id);
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
    function update($recurrence)
    {
        $response = new Response();

        try {
            if (!$recurrence instanceof Recurrence) {
                throw new Exception("The instance must be a recurrence", -1);
            }

            $sql = 'UPDATE Recurrences 
                    SET Recurrence = "' . $recurrence->recurrence . '", BookingId = ' . $recurrence->bookingId . '
                WHERE Id = '. $recurrence->id;
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
            $sql = 'DELETE FROM Recurrences WHERE Id = ' . $id;
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
}

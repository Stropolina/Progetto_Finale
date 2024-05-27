<?php
require_once('../model/response.php');

class RoomRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE
    function create($room)
    {
        $response = new Response();

        try {
            if (!$room instanceof Room) {
                throw new Exception("The instance must be a room", -1);
            }

            $sql = 'INSERT INTO Rooms (`Name`, `Code`, `Building`, `Floor`) VALUES ("' . $room->name . '","' . $room->code . '","' . $room->building . '", ' . $room->floor . ')';
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
            $sql = 'SELECT * FROM Rooms ' . ($id == null ? '' : 'WHERE Id = ' . $id);
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

    function readByCode($code)
    {
        $response = new Response();

        try {
            $sql = 'SELECT * FROM Rooms WHERE `Code` = "' . $code . '"';
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

    //UPDATE
    function update($room)
    {
        $response = new Response();

        try {
            if (!$room instanceof Room) {
                throw new Exception("The instance must be a room", -1);
            }

            $sql = 'UPDATE Rooms 
                    SET `Name` = "' . $room->name . '", Code = "' . $room->code . '", Building = "' . $room->building . '", Floor = ' . $room->floor . '
                WHERE Id = '. $room->id;
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
            $sql = 'DELETE FROM Rooms WHERE Id = ' . $id;
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

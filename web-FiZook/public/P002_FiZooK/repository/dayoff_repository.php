<?php
require_once('../model/response.php');

class DayOffRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE
    function create($dayoff)
    {
        $response = new Response();

        try {
            if (!$dayoff instanceof DayOff) {
                throw new Exception("The instance must be a day off", -1);
            }

            $from = date("Y-m-d H:i:s",strtotime($dayoff->from));
            $to = date("Y-m-d H:i:s",strtotime($dayoff->to));

            $sql = 'INSERT INTO DaysOff (`Name`, `From`, `To`) VALUES ("' . $dayoff->name . '","' . $from . '","' . $to . '")';
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
            $sql = 'SELECT * FROM DaysOff ' . ($id == null ? '' : 'WHERE Id = ' . $id);
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
    function update($dayoff)
    {
        $response = new Response();

        try {
            if (!$dayoff instanceof DayOff) {
                throw new Exception("The instance must be a day off", -1);
            }

            $from = date("Y-m-d H:i:s",strtotime($dayoff->from));
            $to = date("Y-m-d H:i:s",strtotime($dayoff->to));

            $sql = 'UPDATE DaysOff 
                    SET `Name` = "' . $dayoff->name . '", `From` = "' . $from . '", `To` = "' . $to . '" 
                WHERE `Id` = '. $dayoff->id;
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
            $sql = 'DELETE FROM DaysOff WHERE Id =' . $id;
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

    function deleteAll()
    {
        $response = new Response();

        try {
            $sql = 'DELETE FROM DaysOff';
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

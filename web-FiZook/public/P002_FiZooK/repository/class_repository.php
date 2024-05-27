<?php
require_once('../model/response.php');

class ClassRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE
    function create($class)
    {
        $response = new Response();

        try {
            if (!$class instanceof Classroom) {
                throw new Exception("The instance must be a class", -1);
            }

            $sql = 'INSERT INTO Classes (`Name`) VALUES ("' . $class->name . '")';
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
            $sql = 'SELECT * FROM Classes '. ($id == null ? '' : 'WHERE Id = ' . $id);
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
    function update($class)
    {
        $response = new Response();

        try {
            if (!$class instanceof Classroom) {
                throw new Exception("The instance must be a class", -1);
            }

            $sql = 'UPDATE Classes 
                    SET `Name` = "' . $class->name . '"
                WHERE Id = '. $class->id;
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
            $sql = 'DELETE FROM Classes WHERE Id =' . $id;
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

    function search($filter)
    {
        $response = new Response();

        try {
            $sql = 'SELECT Id AS `Key`, Name AS `Value` FROM Classes WHERE Name LIKE "%' . $filter . '%"';
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
}

<?php
class UserSubjectClassRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE 
    function create($userId, $subjectId, $classId)
    {
        $sql = 'INSERT INTO UsersSubjectsClasses (UserId'. ($subjectId == null ? '' : ', SubjectId') . '' . ($classId == null ? ')' : ', ClassId)') .' VALUES (' . $userId . '' . ($subjectId == null ? '' : ', ' . $subjectId) . '' . ($classId == null ? ')' : ', ' . $classId . ')');
        $result = $this->db->query($sql);

        return $result;
    }

    //READ
    function read($id)
    {
        $sql = 'SELECT * FROM UsersSubjectsClasses '. ($id == null ? '' : 'WHERE Id = ' . $id);
        if ($id == null) {
            $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        } else {
            $result = $this->db->query($sql)->fetch();
        }

        return $result;
    }

    //UPDATE
    function update($id, $userId, $subjectId, $classId)
    {
        $sql = 'UPDATE UsersSubjectsClasses 
                    SET UserId = ' . $userId . ', SubjectId = ' . $subjectId . ', ClassId = ' . $classId . '
                WHERE Id = '. $id;
        $result = $this->db->query($sql);

        return $result;
    }

    //DELETE
    function delete($id)
    {
        $sql = 'DELETE FROM UsersSubjectsClasses WHERE Id =' . $id;
        $result = $this->db->query($sql);

        return $result;
    }

    function getClassesByUser($userId) {
        $sql = 'SELECT Class FROM VwUsersSubjectsClasses WHERE UserId = ' . $userId . ' AND Class IS NOT NULL GROUP BY Class ORDER BY Class';
        $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }

    function readSubjectsByUser($userId) {
        $sql = 'SELECT CONCAT(U.FirstName, " ", U.LastName) AS UserName, C.Name AS ClassName, S.Name AS SubjectName
                    FROM `UsersSubjectsClasses` AS USC
                        LEFT JOIN Subjects AS S
                            ON S.Id = USC.SubjectId
                        LEFT JOIN Classes AS C
                            ON C.Id = USC.ClassId
                        LEFT JOIN Users AS U
                            ON U.Id = USC.UserId
                        WHERE UserId = ' . $userId . ' AND C.Id IS NOT NULL;';
        $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }
}

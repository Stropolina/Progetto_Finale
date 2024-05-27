<?php
class RolePermissionRepository
{
    public $db;

    function __construct($conn)
    {
        $this->db = $conn;
    }

    //CREATE 
    function create($roleId, $permissionId)
    {
        $sql = 'INSERT INTO RolesPermissions (RoleId, PermissionId) VALUES (' . $roleId . ', ' . $permissionId . ')';
        $result = $this->db->query($sql);

        return $result;
    }

    //READ
    function read($id)
    {
        $sql = 'SELECT * FROM RolesPermissions '. ($id == null ? '' : 'WHERE Id = ' . $id);
        if ($id == null) {
            $result = $this->db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        } else {
            $result = $this->db->query($sql)->fetch();
        }

        return $result;
    }

    //UPDATE
    function update($id, $roleId, $permissionId)
    {
        $sql = 'UPDATE RolesPermissions 
                    SET RoleId = ' . $roleId . ', PermissionId = ' . $permissionId . '
                WHERE Id = '. $id;
        $result = $this->db->query($sql);

        return $result;
    }

    //DELETE
    function delete($id)
    {
        $sql = 'DELETE FROM RolesPermissions WHERE Id =' . $id;
        $result = $this->db->query($sql);

        return $result;
    }
}

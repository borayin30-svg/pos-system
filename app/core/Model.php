<?php
/**
 * Base Model
 * Provides CRUD operations
 */

namespace App\Core;

use Exception;

class Model
{
    protected $table;
    protected $db;
    protected $fillable = [];

    public function __construct()
    {
        $this->db = Database::getInstance()->getConnection();
    }

    /**
     * Find single record by ID
     */
    public function find($id)
    {
        $stmt = $this->db->prepare("SELECT * FROM {$this->table} WHERE id = ? LIMIT 1");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    /**
     * Find all records with optional where clause
     */
    public function findAll($where = [], $limit = null, $offset = null)
    {
        $sql = "SELECT * FROM {$this->table}";
        $params = [];

        if (!empty($where)) {
            $conditions = [];
            foreach ($where as $key => $value) {
                $conditions[] = "$key = ?";
                $params[] = $value;
            }
            $sql .= " WHERE " . implode(" AND ", $conditions);
        }

        if ($limit) {
            $sql .= " LIMIT " . intval($limit);
        }

        if ($offset) {
            $sql .= " OFFSET " . intval($offset);
        }

        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    /**
     * Create new record
     */
    public function create($data)
    {
        $data = array_intersect_key($data, array_flip($this->fillable));

        $columns = array_keys($data);
        $placeholders = array_fill(0, count($data), '?');

        $sql = "INSERT INTO {$this->table} (" . implode(',', $columns) . ") VALUES (" . implode(',', $placeholders) . ")";

        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute(array_values($data));

        return $result ? $this->db->lastInsertId() : false;
    }

    /**
     * Update record
     */
    public function update($id, $data)
    {
        $data = array_intersect_key($data, array_flip($this->fillable));

        $sets = [];
        $params = [];

        foreach ($data as $key => $value) {
            $sets[] = "$key = ?";
            $params[] = $value;
        }

        $params[] = $id;

        $sql = "UPDATE {$this->table} SET " . implode(', ', $sets) . " WHERE id = ?";

        $stmt = $this->db->prepare($sql);
        return $stmt->execute($params);
    }

    /**
     * Delete record
     */
    public function delete($id)
    {
        $sql = "DELETE FROM {$this->table} WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    /**
     * Count records
     */
    public function count($where = [])
    {
        $sql = "SELECT COUNT(*) as total FROM {$this->table}";
        $params = [];

        if (!empty($where)) {
            $conditions = [];
            foreach ($where as $key => $value) {
                $conditions[] = "$key = ?";
                $params[] = $value;
            }
            $sql .= " WHERE " . implode(" AND ", $conditions);
        }

        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        $result = $stmt->fetch();
        return $result['total'] ?? 0;
    }

    /**
     * Raw query
     */
    public function query($sql, $params = [])
    {
        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }
}

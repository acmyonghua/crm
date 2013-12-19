<?php

class Application_Model_Cliente {

    public static function insert(array $data) {
        $cliente = new Application_Model_DbTable_Cliente();
        return $cliente->insert($data);
    }

    public static function update(array $data) {
        $cliente = new Application_Model_DbTable_Cliente();
        $id = $data['cliente_id'];
        unset($data['cliente_id']);
        $where = $cliente->getAdapter()->quoteInto('cliente_id = ?', $id);
        return $cliente->update($data, $where);
    }

}


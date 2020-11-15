<?php
$url = dirname(dirname(dirname(__DIR__)));
require_once($url."/php/model/general/generalClass.php");

class ciudadClass extends general{
    /**
     * @desc    Consultar las ciudades
     * @param   none
     * @return  $Array
     */
    public function obtenerCiudades($id){
        $sql = "SELECT * FROM ciudad WHERE 1";
        if($id){
            $sql .= " AND id = :id";
        }
        $sql .= " AND id_estatus = 1 ORDER BY nombre ASC";
        $arrayParam = array(':id' => $id);
        return $this->executeSql($sql, $arrayParam);
    }
}
?>
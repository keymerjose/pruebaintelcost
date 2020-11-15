<?php
$url = dirname(dirname(dirname(__DIR__)));
require_once($url."/php/model/general/generalClass.php");

class tiposClass extends general{
    /**
     * @desc    Obtener tipos de vivienda
     * @param   $id integer
     * @return  $Array array
     */
    public function obtenerTipos($id){
        $sql = "SELECT * FROM tipo WHERE 1";
        if(!empty($id)){
            $sql .= " AND id = :id";
        }
        $sql .= " ORDER BY nombre ASC";
        $arrayParam = array(':id' => $id);
        return $this->executeSql($sql, $arrayParam);
    }
}
?>
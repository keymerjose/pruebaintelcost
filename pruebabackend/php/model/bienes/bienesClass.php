<?php
$url = dirname(dirname(dirname(__DIR__)));
require_once($url."/php/model/general/generalClass.php");

class bienesClass extends general{

    /**
     * @desc    Obtener los bienes registrados en la BD
     * @param   $cantidadMostrar integer
     *          $pag integer
     *          $id integer
     * @return  $Array array
     */
    public function obtenerBienes($cantidadMostrar, $pag, $id, $id_ciudad, $id_tipo, $idBienesGuardados){
        $sql = "SELECT 
                datos_generales.*,
                ciudad.nombre AS ciudad,
                tipo.nombre AS tipo
                FROM datos_generales
                INNER JOIN ciudad ON datos_generales.id_ciudad = ciudad.id
                INNER JOIN tipo ON datos_generales.id_tipo = tipo.id
                WHERE 1";
        if(!empty($id)){
            $sql .= " AND datos_generales.id IN ($id)";
        }
        if(!empty($id_ciudad)){
            $sql .= " AND datos_generales.id_ciudad IN ($id_ciudad)";
        }
        if(!empty($id_tipo)){
            $sql .= " AND datos_generales.id_tipo IN ($id_tipo)";
        }
        if(!empty($idBienesGuardados)){
            $sql .= " AND datos_generales.id NOT IN ($idBienesGuardados)";
        }
        $sql .= " ORDER BY ciudad.nombre ASC";
        if(!empty($cantidadMostrar) AND !empty($pag)){
            $sql .= " LIMIT ".$cantidadMostrar." OFFSET ".(($pag - 1) * $cantidadMostrar);
        }
        return $this->executeSql($sql, '');
    }

    public function guardarFavorito($id){
        $sql = "INSERT INTO bienes_guardados (id_datos_generales) VALUES (:id)";
        $arrayParam = array(':id' => $id);
        $this->executeSql($sql, $arrayParam);
    }

    public function obtenerBienesGuardados(){
        $sql = "SELECT * FROM bienes_guardados";
        return $this->executeSql($sql, '');
    }

    public function eliminarFavorito($id){
        $sql = "DELETE FROM bienes_guardados WHERE id_datos_generales = :id";
        $arrayParam = array(':id' => $id);
        $this->executeSql($sql, $arrayParam);
    }
}
?>
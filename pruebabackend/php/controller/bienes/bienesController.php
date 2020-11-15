<?php
$url = dirname(dirname(dirname(__DIR__)));
require_once($url."/php/model/bienes/bienesClass.php");
$bienes = new bienesClass();

if($_POST['type'] == 'guardar_favorito'){
    $bienes->guardarFavorito($_POST['id']);
}

if($_POST['type'] == 'eliminar_favorito'){
    $bienes->eliminarFavorito($_POST['id']);
}
?>
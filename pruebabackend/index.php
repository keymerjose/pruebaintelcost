<?php
require_once "php/model/ciudad/ciudadClass.php";
require_once "php/model/tipos/tiposClass.php";
require_once "php/model/bienes/bienesClass.php";

$ciudad       = new ciudadClass();
$tipos        = new tiposClass();
$bienes       = new bienesClass();

$arrayCiudad  = $ciudad->obtenerCiudades('');
$arrayTipos   = $tipos->obtenerTipos('');
$pag = @$_GET['pag'] ? @$_GET['pag'] : 1;
$pag2 = @$_GET['pag2'] ? @$_GET['pag2'] : 1;

  $id_ciudad  = @$_GET['ciudad'];
  $id_tipo    = @$_GET['tipo'];
  $ids        = $bienes->obtenerBienesGuardados();
  $idBienesGuardados = '';
  if(!empty($ids)){
    foreach($ids AS $key4){
      $idBienesGuardados .= $key4['id_datos_generales'].',';
    }
    $idBienesGuardados = trim($idBienesGuardados, ',');
  }
  $arrayData  = $bienes->obtenerBienes(CANTIDAD_MOSTRAR, $pag, '', $id_ciudad, $id_tipo, $idBienesGuardados);
  $TotalReg   = count($bienes->obtenerBienes('', '', '', $id_ciudad, $id_tipo, $idBienesGuardados));

  
  
  
  if(!empty($idBienesGuardados)){
    $arrayBienesGuardados = $bienes->obtenerBienes(CANTIDAD_MOSTRAR, $pag2, $idBienesGuardados, '', '', '');
    $TotalReg2 = count($bienes->obtenerBienes('', '', $idBienesGuardados, '', '', ''));
    $TotalRegistro2 = ceil($TotalReg2 / CANTIDAD_MOSTRAR);
  }else{
    $arrayBienesGuardados = [];
  }
  
  $TotalRegistro = ceil($TotalReg / CANTIDAD_MOSTRAR);
  


?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="css/customColors.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="css/ion.rangeSlider.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css"  media="screen,projection"/>
  <link type="text/css" rel="stylesheet" href="css/index.css"  media="screen,projection"/>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/jquery-confirm.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Formulario</title>
</head>

<body>
  <video src="img/video.mp4" id="vidFondo"></video>

  <div class="contenedor">
    <div class="card rowTitulo">
      <h1>Bienes Intelcost</h1>
    </div>
    <div class="colFiltros">
      <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get" id="formulario">
        <div class="filtrosContenido">
          <div class="tituloFiltros">
            <h5>Filtros</h5>
          </div>
          <div class="filtroCiudad input-field">
            <p><label for="selectCiudad">Ciudad:</label><br></p>
            <select name="ciudad" id="selectCiudad">
              <option value="" selected>Elige una ciudad</option>
              <?php 
                foreach($arrayCiudad AS $key){
                  if($id_ciudad == $key['id']){
                    $selected = 'selected';
                  }else{
                    $selected = '';
                  }
                  echo '<option '.$selected.' value="'.$key['id'].'">'.$key['nombre'].'</option>';
                } 
              ?>
            </select>
          </div>
          <div class="filtroTipo input-field">
            <p><label for="selecTipo">Tipo:</label></p>
            <br>
            <select name="tipo" id="selectTipo">
              <option value="">Elige un tipo</option>
              <?php 
                foreach($arrayTipos AS $key2){
                  if($id_tipo == $key2['id']){
                    $selected2 = 'selected';
                  }else{
                    $selected2 = '';
                  }
                  echo '<option '.$selected2.' value="'.$key2['id'].'">'.$key2['nombre'].'</option>';
                }
              ?>
            </select>
          </div>
          <div class="filtroPrecio">
            <label for="rangoPrecio">Precio:</label>
            <input type="text" id="rangoPrecio" name="precio" value="" />
          </div>
          <div class="botonField">
            <input type="submit" class="btn white" value="Buscar" id="submitButton">
          </div>
        </div>
      </form>
    </div>
    <div id="tabs" style="width: 75%;">
      <ul>
        <li><a href="#tabs-1">Bienes disponibles</a></li>
        <li><a href="#tabs-2">Mis bienes</a></li>
      </ul>
      <div id="tabs-1">
        <div class="colContenido" id="divResultadosBusqueda">
          <div class="tituloContenido card" style="justify-content: center;">
            <h5>Resultados de la búsqueda:</h5>
            <div class="divider"></div>
            <?php foreach($arrayData AS $key3){
                
            ?>
            <div class="card_bienes">
                <img src="img/home.jpg" width="150" height="150">
                <p>
                  Dirección: <span><?php echo $key3['direccion'];?></span><br>
                  Ciudad: <span><?php echo $key3['ciudad'];?></span><br>
                  Teléfono: <span><?php echo $key3['telefono'];?></span><br>
                  Código Postal: <span><?php echo $key3['codigo_postal'];?></span><br>
                  Tipo: <span><?php echo $key3['tipo'];?></span><br>
                  Precio: <span><?php echo $key3['precio'];?></span><br>
                </p>
                <a class="btn white-text" onclick="guardar(<?php echo $key3['id'];?>);">Guardar</a>
            </div>
            <div class="divider"></div>
            <?php } ?>

            <div class="bienes_paginador">
              <?php
              if(!empty($arrayData)){
                  //Operacion matematica para botón siguiente y atrás 
                  $IncrimentNum = (($pag + 1) <= $TotalRegistro) ? ($pag + 1) : 1;
                  $DecrementNum = (($pag - 1)) < 1 ? 1 : ($pag - 1);
                  echo "<ul class='pagination'><li class='waves-effect'><a class='page-link' href='?pag=" . $DecrementNum . "&ciudad=" . $id_ciudad . "&tipo=" . $id_tipo."&pag2=".$pag2 . "'>◀</a></li>";
                  //Se resta y suma con el numero de pag actual con el cantidad de 
                  //números  a mostrar
                  $Desde = $pag - (ceil(CANTIDAD_MOSTRAR / 2) - 1);
                  $Hasta = $pag + (ceil(CANTIDAD_MOSTRAR / 2) - 1);
                  //Se valida
                  $Desde = ($Desde < 1) ? 1 : $Desde;
                  $Hasta = ($Hasta < CANTIDAD_MOSTRAR) ? CANTIDAD_MOSTRAR : $Hasta;
                  //Se muestra los números de paginas
                  for ($i = $Desde; $i <= $Hasta; $i++) {
                      //Se valida la paginacion total
                      //de registros
                      if ($i <= $TotalRegistro) {
                          //Validamos la pag activo
                          if ($i == $pag) {
                              echo "<li class='waves-effect active'><a class='page-link' href='?pag=" . $i . "&ciudad=".$id_ciudad . "&tipo=" . $id_tipo."&pag2=".$pag2."'>" . $i . "</a></li>";
                          } else {
                              echo "<li class='waves-effect'><a class='page-link' href='?pag=" . $i . "&ciudad=".$id_ciudad . "&tipo=" . $id_tipo."&pag2=".$pag2."'>" . $i . "</a></li>";
                          }
                      }
                  }
                  echo "<li class='waves-effect'><a class='page-link' href='?pag=" . $IncrimentNum . "&ciudad=".$id_ciudad . "&tipo=" . $id_tipo."&pag2=".$pag2."'>▶</a></li>";
                  echo '</ul>';
              }
              ?>
            </div>
          </div>
        </div>
      </div>
      
      <div id="tabs-2" >
        <div class="colContenido" id="divResultadosBusqueda">
          <div class="tituloContenido card" style="justify-content: center;">
            <h5>Bienes guardados:</h5>
            <div class="divider"></div>
            <?php foreach($arrayBienesGuardados AS $key5){?>
            <div class="card_bienes">
                <img src="img/home.jpg" width="150" height="150">
                <p>
                  Dirección: <span><?php echo $key5['direccion'];?></span><br>
                  Ciudad: <span><?php echo $key5['ciudad'];?></span><br>
                  Teléfono: <span><?php echo $key5['telefono'];?></span><br>
                  Código Postal: <span><?php echo $key5['codigo_postal'];?></span><br>
                  Tipo: <span><?php echo $key5['tipo'];?></span><br>
                  Precio: <span><?php echo $key5['precio'];?></span><br>
                </p>
                <a class="btn white-text" onclick="eliminar(<?php echo $key5['id'];?>);">Eliminar</a>
            </div>
            <div class="divider"></div>
            <?php } ?>
            <div class="bienes_guardados_paginador">
            <?php
              if(!empty($arrayBienesGuardados)){
                  //Operacion matematica para botón siguiente y atrás 
                  $IncrimentNum2 = (($pag2 + 1) <= $TotalRegistro2) ? ($pag2 + 1) : 1;
                  $DecrementNum2 = (($pag2 - 1)) < 1 ? 1 : ($pag2 - 1);
                  echo "<ul class='pagination'><li class='waves-effect'><a class='page-link' href='?pag=" . $pag . "&ciudad=" . $id_ciudad . "&tipo=" . $id_tipo."&pag2=".$DecrementNum2 . "'>◀</a></li>";
                  //Se resta y suma con el numero de pag actual con el cantidad de 
                  //números  a mostrar
                  $Desde2 = $pag2 - (ceil(CANTIDAD_MOSTRAR / 2) - 1);
                  $Hasta2 = $pag2 + (ceil(CANTIDAD_MOSTRAR / 2) - 1);
                  //Se valida
                  $Desde2 = ($Desde2 < 1) ? 1 : $Desde2;
                  $Hasta2 = ($Hasta2 < CANTIDAD_MOSTRAR) ? CANTIDAD_MOSTRAR : $Hasta2;
                  //Se muestra los números de paginas
                  for ($i2 = $Desde2; $i2 <= $Hasta2; $i2++) {
                      //Se valida la paginacion total
                      //de registros
                      if ($i2 <= $TotalRegistro2) {
                          //Validamos la pag activo
                          if ($i2 == $pag2) {
                              echo "<li class='waves-effect active'><a class='page-link' href='?pag=" . $pag . "&ciudad=".$id_ciudad . "&tipo=" . $id_tipo."&pag2=".$i2."'>" . $i2 . "</a></li>";
                          } else {
                              echo "<li class='waves-effect'><a class='page-link' href='?pag=" . $pag . "&ciudad=".$id_ciudad . "&tipo=" . $id_tipo."&pag2=".$i2."'>" . $i2 . "</a></li>";
                          }
                      }
                  }
                  echo "<li class='waves-effect'><a class='page-link' href='?pag=" . $pag . "&ciudad=".$id_ciudad . "&tipo=" . $id_tipo."&pag2=".$IncrimentNum2."'>▶</a></li>";
                  echo '</ul>';
              }
              ?>
            </div>
          </div>
        </div>
      </div>
    </div>


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
    <script type="text/javascript" src="js/ion.rangeSlider.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/buscador.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/jquery-confirm.js"></script>
    <script src="js/myscript.js"></script>
    <script type="text/javascript">
      $( document ).ready(function() {
          $( "#tabs" ).tabs();
      });
    </script>
  </body>
  </html>

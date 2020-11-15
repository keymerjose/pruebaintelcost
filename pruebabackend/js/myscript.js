function guardar(id){
    $.ajax({
        url: '../pruebabackend/php/controller/bienes/bienesController.php',
        type: 'post',
        data: {
            id: id,
            type: 'guardar_favorito'
        },
        dataType: "html",
        beforeSend: function(){
            
        },
        success: function (e) {
            console.log(e);
            $.alert({
                title: "Bienes",
                content: 'Bien guardado',
                columnClass: 'text-dark',
                buttons: {
                    buttonOk: {
                        text: 'OK',
                        btnClass: 'btn-primary',
                        action: function () {
                            location.reload();
                        }
                    }
                }
            });
        }
    });
}

function eliminar(id){
    $.ajax({
        url: '../pruebabackend/php/controller/bienes/bienesController.php',
        type: 'post',
        data: {
            id: id,
            type: 'eliminar_favorito'
        },
        dataType: "html",
        beforeSend: function(){
            
        },
        success: function (e) {
            console.log(e);
            $.alert({
                title: "Bienes",
                content: 'Bien eliminado',
                columnClass: 'text-dark',
                buttons: {
                    buttonOk: {
                        text: 'OK',
                        btnClass: 'btn-primary',
                        action: function () {
                            location.reload();
                        }
                    }
                }
            });
        }
    });
}
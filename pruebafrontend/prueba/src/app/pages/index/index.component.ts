import { Component, OnInit } from '@angular/core';

import { DataService } from '../../services/data/data.service';
import { datos } from '../../interfaces/datos';


@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {
  total_data:datos[] = [];
  txt_buscar:string = '';

  constructor(private service: DataService) { }

  ngOnInit(): void {
    this.buscar('', '');
  }

  ver_mas(id:number){
    $('#modalImagen img').attr('src', '');
    $('#tags, #vistas, #likes').empty();
    let data = this.total_data.find(objeto => objeto.id === id);
    let tags = data['tags'].split(',');
    $('#modalImagen img').attr('src', data['largeImageURL']);
    let campos = '';
    for(let a = 0; a < tags.length; a++){
      campos += '<span class="badge badge-info m-1">'+tags[a]+'</span>';
    }
    $('#tags').append(campos);
    $('#vistas').html('<span class="badge badge-primary"><i class="fas fa-eye"></i>&nbsp;'+data['views']+'</span>');
    $('#likes').html('<span class="badge badge-primary"><i class="fas fa-thumbs-up"></i>&nbsp;'+data['likes']+'</span>');
    ($('#modalImagen') as any).modal('show');
  }

  buscar(q:string, categoria:string){
    $('#btnBuscar').html('<i class="fas fa-spinner"></i>').addClass('disabled');
    this.total_data = [];
    this.service.buscar(q, categoria).subscribe(
      data => {
        this.total_data.push( ... data['hits']);
        $('#btnBuscar').html('<i class="fas fa-search"></i>').removeClass('disabled');
        ($('.card span.badge') as any).tooltip();
        console.log(data);
      },
      error => {
        console.log(error);
      }
    );
  }

}

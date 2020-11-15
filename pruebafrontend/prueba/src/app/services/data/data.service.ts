import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
@Injectable({
  providedIn: 'root'
})
export class DataService {
  url = environment.url;
  constructor(private http: HttpClient) { }

  buscar(q:string, categoria:string){
    if(q != ''){
      return this.http.get(this.url + '&q=' + q);
    }else if(categoria != ''){
      return this.http.get(this.url + '&category=' + categoria);
    }else{
      return this.http.get(this.url);
    }
  }
}

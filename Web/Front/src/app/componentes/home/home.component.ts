import { Component, OnInit } from '@angular/core';
import { DataService } from '../../data.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(public dataService: DataService, private router: Router,
    private route: ActivatedRoute) { }

  nombre : any;
  user: any;
  itsAdmin: boolean = false;

  ngOnInit() {
    this.nombre = this.route.snapshot.paramMap.get('nombre');
    this.user = this.route.snapshot.paramMap.get('usuario');

    if (this.user == 1){
      this.itsAdmin= true;
    }

  }

  goToProductos(){
    this.router.navigate(['/productos']);
  }

goToCategorias(){

}

goToMercaderias(){

  }

goToProveedores(){
  this.router.navigate(['/proveedores']);

}

goToZonasAlmacenamiento(){

}

goToTrabajadores(){

}

goToActivos(){
  
}
  

}

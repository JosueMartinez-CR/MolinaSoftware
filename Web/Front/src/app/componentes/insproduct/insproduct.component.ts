import { Component, OnInit } from '@angular/core';
import { newproducto } from 'src/app/objetos/newproduct';
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from 'src/app/data.service';
import Swal from 'sweetalert2'

@Component({
  selector: 'app-insproduct',
  templateUrl: './insproduct.component.html',
  styleUrls: ['./insproduct.component.scss']
})
export class InsproductComponent implements OnInit {

  constructor(public dataService: DataService, private router: Router,
    private route: ActivatedRoute,) { }

  ngOnInit(): void {
  }

  articuloselect: newproducto = new newproducto("", "", 0,"",0,0,1,0);
  producto:any;


  agregar() {
    this.producto = new newproducto(
      this.articuloselect.idMercaderia, 
      this.articuloselect.codigoProducto, 
      this.articuloselect.idCategoria, 
      this.articuloselect.nombre, 
      this.articuloselect.precioVenta, 
      this.articuloselect.precioCompra, 
      1, 
      this.articuloselect.cantidad);
  
      console.log(this.producto);
      this.insertar_producto();
  }


async insertar_producto() {
    this.dataService.insertar_producto(
      this.articuloselect.idMercaderia, 
      this.articuloselect.codigoProducto, 
      this.articuloselect.idCategoria, 
      this.articuloselect.nombre, 
      this.articuloselect.precioVenta, 
      this.articuloselect.precioCompra, 
      1, 
      this.articuloselect.cantidad).toPromise().
      then((res: any) => {
       
        if (res == null) {
          Swal.fire('¡Producto agregado!', '', 'success')
         this.router.navigate(['/productos']);
        }
      }, (error: any) => {
        Swal.fire('No se ha podido agregar', '', 'info')
        this.router.navigate(['/productos']);
      });
  }


}

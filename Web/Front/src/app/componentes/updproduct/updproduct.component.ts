import { Component, OnInit } from '@angular/core';
import { newproducto } from 'src/app/objetos/newproduct';
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from 'src/app/data.service';
import Swal from 'sweetalert2'

@Component({
  selector: 'app-updproduct',
  templateUrl: './updproduct.component.html',
  styleUrls: ['./updproduct.component.scss']
})
export class UpdproductComponent implements OnInit {

  
  constructor(public dataService: DataService, private router: Router,
    private route: ActivatedRoute) { }



  articuloselect: newproducto = new newproducto("", "", 0,"",0,0,1,0);
  producto:any;
  
  codigo:any;

 idMercaderia:any;
 lastCodigo:any;
 codigoProducto:any;
 idCategoria:any;
 nombre:any; 
 precioVenta:any;
 precioCompra:any;
 estado:any;
 cantidad:any;
 


  ngOnInit() { 
    this.codigo = this.route.snapshot.paramMap.get('codigo');
    this.cagarProducto(this.codigo);

  }

  modificar() {
      this.modificar_producto();
  }


async modificar_producto() {
  console.log("aca: " + this.lastCodigo );
  console.log( this.articuloselect);

    this.dataService.modificarProducto(
      this.lastCodigo, 
      this.articuloselect.codigoProducto, 
      this.articuloselect.idCategoria, 
      this.articuloselect.nombre, 
      this.articuloselect.precioVenta, 
      this.articuloselect.precioCompra, 
      1, 
      this.articuloselect.cantidad
      
      
      ).toPromise().
      then((res: any) => {
       
        if (res == null) {
          Swal.fire('¡Producto modificado!', '', 'success')
        //  this.router.navigate(['/productos']);
        }
      }, (error: any) => {
        Swal.fire('No se ha podido modificar', '', 'info')
        //this.router.navigate(['/productos']);
      });
  }

  async cagarProducto(codigoProducto: string) {
    this.dataService.get_producto(codigoProducto).
      subscribe(clientes => {

      this.producto = clientes;

      console.log(this.producto);
      this.lastCodigo=this.producto[0].codigoProducto;
      this.codigoProducto=this.producto[0].codigoProducto;
      this.idCategoria=this.producto[0].idCategoria;
      this.nombre=this.producto[0].nombre;
      this.precioVenta=this.producto[0].precioVenta;
      this.precioCompra=this.producto[0].precioCompra;
      this.estado=this.producto[0].estado;
      this.cantidad=this.producto[0].cantidad;


      this.articuloselect.idMercaderia = "";
      this.articuloselect.codigoProducto = this.lastCodigo
      this.articuloselect.idCategoria=this.idCategoria
      this.articuloselect.nombre=this.nombre
      this.articuloselect.precioVenta=this.precioVenta
      this.articuloselect.precioCompra=this.precioCompra
      this.articuloselect.estado=this.estado
      this.articuloselect.cantidad=this.cantidad;
      })
  }

}

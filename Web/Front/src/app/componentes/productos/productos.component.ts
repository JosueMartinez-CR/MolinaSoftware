import { Component, OnInit,ViewChild } from '@angular/core';
import { MatTable } from '@angular/material/table';
import Swal from 'sweetalert2'
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from '../../data.service';
import { Articulo } from 'src/app/objetos/articulo';
@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.scss']
})



export class ProductosComponent implements OnInit {

  constructor(private dataService: DataService, private router: Router,
    private route: ActivatedRoute) { }


  columnas: string[] = ['Codigo', 'Nombre', 'Precio Compra', 'Precio Venta',  'Estado', 'Cantidad',' ','  '];

  datos: Articulo[] = [];
 

  articuloselect: Articulo = new Articulo("", "", 0,0,0,0);

  @ViewChild(MatTable) tabla1!: MatTable<Articulo>;

  borrarFila(cod: number) {
    if (confirm("Realmente quiere borrarlo?")) {
      this.datos.splice(cod, 1);
      this.tabla1.renderRows();
    }
  }

 


  
  ngOnInit() { 
    this.loadProducts();
  }

  loadProducts(){
    this.dataService.get_productos().
        subscribe(productos => {
          this.datos = productos
          })
        }

  
  goToAgregar(){

    this.router.navigate(['/add/productos']);

  }
  
  codigoProducto:any;

  goToModificar(index:number){
    
    this.codigoProducto = this.datos[index].codigoProducto;
    console.log(this.codigoProducto)
    this.router.navigate(['modificar/productos/',this.codigoProducto]);
  }

  goToEliminar(codigo:any,nombre:any,index:number){

    codigo = this.datos[index].codigoProducto;
    nombre = this.datos[index].nombre;
   
      
        Swal.fire({
          title: '¿Eliminar al proucto: ' + codigo + '\n' + nombre + '?',
          showDenyButton: true,
          denyButtonText: `Eliminar`,
          confirmButtonText: 'Cancelar',
        }).then((result) => {
          if (result.isDenied) {
            this.dataService.del_producto(codigo).toPromise().then((res: any) => {
              console.log("res", res);
              if (res==null) {
                Swal.fire('Eliminado!', '', 'success')
                this.ngOnInit();
              } else {
                Swal.fire('Algo a salido mal', '', 'info')
                this.ngOnInit();
              }
            }, (error:any) => {
              Swal.fire('No se ha podido eliminar', '', 'info')
              this.ngOnInit();
            });
          }
        })
      
  }

  goToControl(){

  }


}







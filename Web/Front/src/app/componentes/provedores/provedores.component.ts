import { Component, OnInit,ViewChild } from '@angular/core';
import { MatTable } from '@angular/material/table';
import Swal from 'sweetalert2'
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from '../../data.service';
import { provedor } from 'src/app/objetos/provedores';
@Component({
  selector: 'app-provedores',
  templateUrl: './provedores.component.html',
  styleUrls: ['./provedores.component.scss']
})
export class ProvedoresComponent implements OnInit {

  constructor(private dataService: DataService, private router: Router,
    private route: ActivatedRoute) { }

    columnas: string[] = ['Codigo', 'Nombre', 'Telefono','Correo',' ','  '];
    datos: provedor[] = [];


    provedorselect:provedor = new provedor(0, "");

    @ViewChild(MatTable) tabla1!: MatTable<provedor>;

  ngOnInit() {
    
    this.loadProve();
  }

  loadProve(){
   
    this.dataService.get_proveedores().
        subscribe(provedores => {
          this.datos = provedores
        
         // console.log(this.datos);
          })
        }

  idProveedor:any;
  
  goToCorreos(index:number){  
    this.idProveedor = this.datos[index].idProveedor;
    console.log(this.idProveedor)
    this.router.navigate(['proveedores/correos/',this.idProveedor]);
  }

  goToTelefonos(index:number){
    this.idProveedor = this.datos[index].idProveedor;
    console.log(this.idProveedor)
    this.router.navigate(['proveedores/telefonos/',this.idProveedor]);
  }

  goToAgregar(){
    this.router.navigate(['add/proveedores/']);
  }

  goToModificar(index:number) {
    this.idProveedor = this.datos[index].idProveedor;
    console.log(this.idProveedor)
    this.router.navigate(['modificar/proveedores/',this.idProveedor]);
  }


  goToEliminar(id:any,nombre:any,index:number){

    id = this.datos[index].idProveedor;
    nombre = this.datos[index].nombre;
   
      
        Swal.fire({
          title: '¿Eliminar al proveedor: ' + id + '\n' + nombre + '?',
          showDenyButton: true,
          denyButtonText: `Eliminar`,
          confirmButtonText: 'Cancelar',
        }).then((result) => {
          if (result.isDenied) {
            this.dataService.del_proveedor(id).toPromise().then((res: any) => {
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
}

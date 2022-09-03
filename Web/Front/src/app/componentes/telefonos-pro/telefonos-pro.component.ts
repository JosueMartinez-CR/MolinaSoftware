import { Component, OnInit,ViewChild } from '@angular/core';
import { MatTable } from '@angular/material/table';
import Swal from 'sweetalert2'
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from '../../data.service';
import { telefono } from 'src/app/objetos/telefono';
import { identifierName } from '@angular/compiler';
@Component({
  selector: 'app-telefonos-pro',
  templateUrl: './telefonos-pro.component.html',
  styleUrls: ['./telefonos-pro.component.scss']
})
export class TelefonosProComponent implements OnInit {

  constructor(private dataService: DataService, private router: Router,
    private route: ActivatedRoute) { }

    columnas: string[] = ['Telefono',' '];
    datos: telefono[] = [];

    id:any;
    telefono:any;
    @ViewChild(MatTable) tabla1!: MatTable<telefono>;

   
  ngOnInit() {
    console.log("hola");
    this.id = this.route.snapshot.paramMap.get('id');
    this.loadTel(this.id);
  }

  loadTel(id:Number){
   
    this.dataService.cons_provedorTelefono(id).
        subscribe(telefonos => {
          this.datos = telefonos
        
         console.log(this.datos);
          })
        }

    
    
    
    agregar() {
          console.log("hola1");
          this.dataService.ins_telefono_proveedor(
            this.id, 
            this.telefono
           ).toPromise().
            then((res: any) => {
             
              if (res == null) {
                Swal.fire('¡Teléfono agregado!', '', 'success')
                this.ngOnInit();
              }
            }, (error: any) => {
              Swal.fire('No se ha podido agregar', '', 'info')
              this.ngOnInit();
            });
        }
      

        goToEliminar(id:number,telefono2:any,index:number){

          id = this.datos[index].idProveedor;
          telefono2 = this.datos[index].telefono;
          console.log(id,telefono2);
              Swal.fire({
                title: '¿Eliminar al telefono: ' + '\n' + telefono2 + '?',
                showDenyButton: true,
                denyButtonText: `Eliminar`,
                confirmButtonText: 'Cancelar',
              }).then((result) => {
                if (result.isDenied) {
                  this.dataService.del_telfonoProveedor(id,telefono2).toPromise().then((res: any) => {
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

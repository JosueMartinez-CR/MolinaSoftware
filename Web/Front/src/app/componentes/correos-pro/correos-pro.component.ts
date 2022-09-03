import { Component, OnInit,ViewChild } from '@angular/core';
import { MatTable } from '@angular/material/table';
import Swal from 'sweetalert2'
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from '../../data.service';
import { correo } from 'src/app/objetos/correo';
@Component({
  selector: 'app-correos-pro',
  templateUrl: './correos-pro.component.html',
  styleUrls: ['./correos-pro.component.scss']
})
export class CorreosProComponent implements OnInit {
  constructor(private dataService: DataService, private router: Router,
    private route: ActivatedRoute) { }

    columnas: string[] = ['Correo',' '];
    datos: correo[] = [];
    correo:any;

    @ViewChild(MatTable) tabla1!: MatTable<correo>;

    id:any;
  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('id');
    this.loadProve(this.id);
  }

  loadProve(id:number){
   
    this.dataService.cons_provedorCorreo(id).
        subscribe(correos => {
          this.datos = correos
        
         // console.log(this.datos);
          })
        }


        agregar() {
          console.log("hola1");
          this.dataService.ins_correo_proveedor(
            this.id, 
            this.correo
           ).toPromise().
            then((res: any) => {
             
              if (res == null) {
                Swal.fire('¡Correo agregado!', '', 'success')
                this.ngOnInit();
              }
            }, (error: any) => {
              Swal.fire('No se ha podido agregar', '', 'info')
              this.ngOnInit();
            });
        }


        goToEliminar(id:number,correo:any,index:number){

          id = this.datos[index].idProveedor;
          correo = this.datos[index].correo;
          console.log(id,correo);
              Swal.fire({
                title: '¿Eliminar al correo: ' + '\n' + correo + '?',
                showDenyButton: true,
                denyButtonText: `Eliminar`,
                confirmButtonText: 'Cancelar',
              }).then((result) => {
                if (result.isDenied) {
                  this.dataService.del_correoProveedor(id,correo).toPromise().then((res: any) => {
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

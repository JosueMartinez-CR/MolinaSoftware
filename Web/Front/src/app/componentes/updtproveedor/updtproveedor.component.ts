import { Component, OnInit } from '@angular/core';
import { newproveedor } from 'src/app/objetos/newproveedor';
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from 'src/app/data.service';
import Swal from 'sweetalert2'

@Component({
  selector: 'app-updtproveedor',
  templateUrl: './updtproveedor.component.html',
  styleUrls: ['./updtproveedor.component.scss']
})
export class UpdtproveedorComponent implements OnInit {

 
  constructor(public dataService: DataService, private router: Router,
    private route: ActivatedRoute,) { }

  proveedorselect: newproveedor = new newproveedor(0,0,"","","");
  proveedor:any;

  id:any;
  idProveedor:any;
  nombre:any;


  ngOnInit(){
    this.id = this.route.snapshot.paramMap.get('id');
    this.cagarProveedor(this.id);
  }

  async modificar_proveedor() {
   
      this.dataService.upd_proveedor(
        this.idProveedor, 
        this.proveedorselect.idProveedor, 
        1,
        this.proveedorselect.nombre, 
        ).toPromise().
        then((res: any) => {
         
          if (res == null) {
            Swal.fire('¡Proveedor modificado!', '', 'success')
            this.router.navigate(['/proveedores']);
          }
        }, (error: any) => {
          Swal.fire('No se ha podido modificar', '', 'info')
          this.router.navigate(['/proveedores']);
        });
    }


  async cagarProveedor(idProveedor:number) {
    this.dataService. get_proveedor(idProveedor).
      subscribe(clientes => {

      this.proveedor = clientes;

      console.log(this.proveedor);
      this.idProveedor = this.proveedor[0].idProveedor;
      this.nombre = this.proveedor[0].nombre;
      


     
      this.proveedorselect.idProveedor = this.idProveedor;
      this.proveedorselect.nombre=this.nombre;
  
      })
  }

}

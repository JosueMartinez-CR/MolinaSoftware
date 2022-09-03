import { Component, OnInit } from '@angular/core';
import { newproveedor } from 'src/app/objetos/newproveedor';
import { Router, ActivatedRoute } from '@angular/router';
import { DataService } from 'src/app/data.service';
import Swal from 'sweetalert2'
@Component({
  selector: 'app-insproveedor',
  templateUrl: './insproveedor.component.html',
  styleUrls: ['./insproveedor.component.scss']
})
export class InsproveedorComponent implements OnInit {

 
  constructor(public dataService: DataService, private router: Router,
    private route: ActivatedRoute,) { }

  ngOnInit() {
  }

  proveedorselect: newproveedor = new  newproveedor(0,0,"","","");
  proveedor:any;


  agregar() {
    this.proveedor = new newproveedor (
      this.proveedorselect.idProveedor, 
      1, 
      this.proveedorselect.nombre, 
      this.proveedorselect.telefono, 
      this.proveedorselect.correo, );
  
      console.log(this.proveedor);
      this.insertar_proveedor();
  }


async insertar_proveedor() {
    this.dataService.ins_proveedor(
      this.proveedorselect.idProveedor, 
      1, 
      this.proveedorselect.nombre, 
      this.proveedorselect.telefono, 
      this.proveedorselect.correo,).toPromise().
      then((res: any) => {
       
        if (res == null) {
          Swal.fire('¡Proveedor agregado!', '', 'success')
         this.router.navigate(['/proveedores']);
        }
      }, (error: any) => {
        Swal.fire('No se ha podido agregar', '', 'info')
        this.router.navigate(['/proveedores']);
      });
  }
}

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { newproducto } from './objetos/newproduct';
import { provedor } from 'src/app/objetos/provedores';
import { correo } from './objetos/correo';
import { telefono } from './objetos/telefono';
@Injectable({
  providedIn: 'root'
})
export class DataService {

  private API = "http://localhost:3002/api";

  constructor(private response: HttpClient) { }

  ngOnInit() { }


  login_Confirmation(codigo: string, tipoTrabajador: number) {
    let data = { codigo, tipoTrabajador };
    return this.response.get(this.API + '/molinasoft/users/' +codigo + '/' + tipoTrabajador);
  }

  get_productos() {
    return this.response.get<productos[]>(this.API + '/molinasoft/productos');
  }

  get_proveedores() {
    return this.response.get<provedor[]>(this.API + '/molinasoft/proveedores');
  }

  get_producto(codigoProducto: string) {
    return this.response.get<newproducto[]>(this.API + '/molinasoft/producto/' + codigoProducto);
  }

  get_proveedor(idProveedor:number) {
    return this.response.get<provedor[]>(this.API + '/molinasoft/proveedor/' + idProveedor);
  }

insertar_producto(
    idMercaderia: string,
    codigoProducto: string,  
    idCategoria: number,
    nombre: string,
    precioVenta: number,
    precioCompra: number,
    estado:number,
    cantidad:number
  ) {
    let data = {
      idMercaderia,
      codigoProducto,  
      idCategoria,
      nombre,
      precioVenta,
      precioCompra,
      estado,
      cantidad
    };
    return this.response.post(this.API + '/molinasoft/product/insert', data);
  }


  ins_proveedor(
   idProveedor: number,
   idSupermercado: number,  
   nombre: string,
   telefono:string,
   correo:string
  ) {
    let data = {
      idProveedor,
      idSupermercado,  
      nombre,
      telefono,
      correo
    };
    return this.response.post(this.API + '/molinasoft/proveedores/insert', data);
  }
 


modificarProducto(
  lastCodigo: string,
  codigoProducto: string,  
  idCategoria: number,
  nombre: string,
  precioVenta: number,
  precioCompra: number,
  estado:number,
  cantidad:number
) {
  let data = {
    lastCodigo,
    codigoProducto,  
    idCategoria,
    nombre,
    precioVenta,
    precioCompra,
    estado,
    cantidad
  };
  return this.response.post(this.API +'/molinasoft/producto/modificar', data);
}


upd_proveedor(
  lastId: number,
  idProveedor: number,  
  idSupermercado:number,
  nombre: string,
  
) {
  let data = {
    lastId,
    idProveedor,
    idSupermercado,
    nombre
  };
  return this.response.post(this.API +'/molinasoft/proveedor/modificar', data);
}


del_producto(idCProducto:string) {
  let data = { idCProducto};
  return this.response.put(this.API + '/molinasoft/delete/' + idCProducto,data);
}

del_proveedor(idProveedor:number) {
  let data = { idProveedor};
  return this.response.put(this.API + '/molinasoft/delete/proveedor/' + idProveedor,data);
}

cons_provedorCorreo(idProveedor:Number){
  return this.response.get<correo[]>(this.API + '/molinasoft/proveedor/correos/' + idProveedor);
}
cons_provedorTelefono(idProveedor:Number){
  return this.response.get<telefono[]>(this.API + '/molinasoft/proveedor/telefonos/' + idProveedor);
}


ins_telefono_proveedor(idProveedor: number, telefono: string, ) {
   let data = {idProveedor,telefono}; 
   return this.response.post(this.API + '/molinasoft/proveedores/telefono/insert', data);
 }

 ins_correo_proveedor(idProveedor: number, correo: string, ) {
  let data = {idProveedor,correo}; 
  return this.response.post(this.API + '/molinasoft/proveedores/correo/insert', data);
}

del_correoProveedor(idProveedor:number,correo:string) {
  let data = {idProveedor,correo};
  return this.response.put(this.API + '/molinasoft/borrar2/'+idProveedor ,data);
}

del_telfonoProveedor(idProveedor:number,telefono:string) {
  let data = {idProveedor,telefono};
  return this.response.put(this.API + '/molinasoft/borrar1/'+idProveedor ,data);
}


}




export class productos {
  constructor(
    public codigoProducto: string, 
    public nombre: string, 
    public precioCompra: number,
    public precioVenta: number,
    public estado:number,
    public cantidad:number) {
  }
}
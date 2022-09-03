

export class Articulo {
    constructor(
      public codigoProducto: string, 
      public nombre: string, 
      public precioCompra: number,
      public precioVenta: number,
      public estado:number,
      public cantidad:number) {
    }
}
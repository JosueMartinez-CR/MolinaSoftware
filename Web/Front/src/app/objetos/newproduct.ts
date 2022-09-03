
export class newproducto {
    constructor(
      public idMercaderia: string,
      public codigoProducto: string,  
      public idCategoria: number,
      public nombre: string,
      public precioVenta: number,
      public precioCompra: number,
      public estado:number,
      public cantidad:number) {
    }
}
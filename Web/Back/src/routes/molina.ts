import { Router, Request, Response } from "express";
import { config } from "../config/config";
var mssql = require('mssql');

class MolinaRouter {
  router: Router;

  constructor() {
    this.router = Router();
  }
  /**
   * @method get
   * @param req 
   * @param res 
   */

  //................................. GETS ...................................


  async login_Confirmation(req: Request, res: Response) {
    let { codigo,tipoTrabajador } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('codigo', mssql.CHAR(6), codigo)
        .input('tipoTrabajador', mssql.VARCHAR(32), tipoTrabajador)

        .execute('loggin')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset;
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }


  async get_productos(req: Request, res: Response) {
    new mssql.ConnectionPool(config).connect().then((pool: any) => {  //Connect to database
      return pool.request().execute('get_productos')              // Execute the SP into database
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async get_proveedores(req: Request, res: Response) {
    new mssql.ConnectionPool(config).connect().then((pool: any) => {  //Connect to database
      return pool.request().execute('get_proveedores')              // Execute the SP into database
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }


  async insertar_producto(req: Request, res: Response) {
    let {idMercaderia,
      codigoProducto,  
      idCategoria,
      nombre,
      precioVenta,
      precioCompra,
      estado,
      cantidad } = req.body;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idMercaderia', mssql.CHAR(12), idMercaderia)
        .input('codigoProducto', mssql.CHAR(12), codigoProducto)
        .input('idCategoria', mssql.INT, idCategoria)
        .input('nombre', mssql.VARCHAR(32), nombre)
        .input('precioVenta', mssql.INT, precioVenta)
        .input('precioCompra', mssql.INT, precioCompra)
        .input('estado', mssql.INT, estado)
        .input('cantidad', mssql.INT, cantidad)

        .execute('ins_nuevo_producto')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      console.log("ROWS " + rows)
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(201).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }



  async ins_proveedor(req: Request, res: Response) {
    let {
      idProveedor,
      idSupermercado,  
      nombre,
      telefono,
      correo } = req.body;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .input('idSupermercado', mssql.INT, idSupermercado)
        .input('nombre', mssql.VARCHAR(32), nombre)
        .input('telefono', mssql.CHAR(9), telefono)
        .input('correo', mssql.VARCHAR(64), correo)

        .execute('ins_proveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      console.log("ROWS " + rows)
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(201).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }


  async ins_telefono_proveedor(req: Request, res: Response) {
    let {
      idProveedor,
      telefono } = req.body;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .input('telefono', mssql.CHAR(9), telefono)
        .execute('ins_telefono_proveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      console.log("ROWS " + rows)
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(201).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async ins_correo_proveedor(req: Request, res: Response) {
    let {
      idProveedor,
      correo } = req.body;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .input('correo', mssql.VARCHAR(64), correo)
        .execute('ins_correo_proveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      console.log("ROWS " + rows)
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(201).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }



  async get_producto(req: Request, res: Response) {
    let { codigoProducto } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('codigoProducto', mssql.CHAR(12), codigoProducto)
        .execute('get_producto')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset;
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async get_proveedor(req: Request, res: Response) {
    let { idProveedor } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .execute('get_proveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset;
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }



  async upd_proveedor(req: Request, res: Response) {
    let {
      lastId,
      idProveedor,
      idSupermercado,
      nombre } = req.body;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('lastId', mssql.INT, lastId)
        .input('idProveedor', mssql.INT, idProveedor)
        .input('idSupermercado', mssql.INT, idSupermercado)
        .input('nombre', mssql.VARCHAR(32), nombre)
        .execute('upd_proveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      console.log("ROWS " + rows)
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(201).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }


  async upd_producto(req: Request, res: Response) {
    let {lastCodigo,
      codigoProducto,  
      idCategoria,
      nombre,
      precioVenta,
      precioCompra,
      estado,
      cantidad } = req.body;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('lastCodigo', mssql.CHAR(12), lastCodigo)
        .input('codigoProducto', mssql.CHAR(12), codigoProducto)
        .input('idCategoria', mssql.INT, idCategoria)
        .input('nombre', mssql.VARCHAR(32), nombre)
        .input('precioVenta', mssql.INT, precioVenta)
        .input('precioCompra', mssql.INT, precioCompra)
        .input('estado', mssql.INT, estado)
        .input('cantidad', mssql.INT, cantidad)

        .execute('upd_producto')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset
      console.log("ROWS " + rows)
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(201).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async del_producto(req: Request, res: Response) {
    let { idCProducto } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idCProducto', mssql.CHAR(12), idCProducto)
        .execute('del_producto')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset

      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async del_proveedor(req: Request, res: Response) {
    let { idProveedor } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.CHAR(12), idProveedor)
        .execute('del_proveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset

      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async del_correoProveedor(req: Request, res: Response) {
    let { idProveedor,correo } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .input('correo', mssql.VARCHAR(64), correo)
        .execute('del_correoProveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset

      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async del_telfonoProveedor(req: Request, res: Response) {
    let { idProveedor,telefono } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .input('telefono', mssql.CHAR(9), telefono)
        .execute('del_telfonoProveedor')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset

      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }


  async cons_provedorCorreo(req: Request, res: Response) {
    let { idProveedor } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .execute('cons_provedorCorreo')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset;
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  async cons_provedorTelefono(req: Request, res: Response) {
    let { idProveedor } = req.params;
    new mssql.ConnectionPool(config).connect().then((pool: any) => {
      return pool.request()
        .input('idProveedor', mssql.INT, idProveedor)
        .execute('cons_provedorTelefono')
    }).then((result: { recordset: any; }) => {
      let rows = result.recordset;
      res.setHeader('Access-Control-Allow-Origin', '*')
      res.status(200).json(rows);
      mssql.close();
    }).catch((err: any) => {
      res.status(500).send({ message: `${err}` })
      mssql.close();
    });
  }

  




  //routes that consult in the FrontEnd
  routes() {
    this.router.get("/users/:codigo/:tipoTrabajador", this.login_Confirmation);
    this.router.get("/productos", this.get_productos);
    this.router.post("/product/insert", this.insertar_producto);
    this.router.get("/producto/:codigoProducto", this.get_producto);
    this.router.get("/proveedor/:idProveedor", this.get_proveedor);
    this.router.get("/proveedores", this.get_proveedores);
    this.router.post("/producto/modificar", this.upd_producto);
    this.router.post("/proveedor/modificar", this.upd_proveedor);
    this.router.put("/delete/:idCProducto", this.del_producto);
    this.router.put("/delete/proveedor/:idProveedor", this.del_proveedor);
    this.router.get("/proveedor/correos/:idProveedor", this.cons_provedorCorreo);
    this.router.get("/proveedor/telefonos/:idProveedor", this.cons_provedorTelefono);
    this.router.get("/proveedores", this.get_proveedores);
    this.router.post("/proveedores/insert", this.ins_proveedor);
    this.router.post("/proveedores/telefono/insert", this.ins_telefono_proveedor);
    this.router.post("/proveedores/correo/insert", this.ins_correo_proveedor);
    this.router.put("/borrar2/:idProveedor", this.del_correoProveedor);
    this.router.put("/borrar1/:idProveedor", this.del_telfonoProveedor);
    //this.router.put("/:Identificacion", this.eliminar_beneficiario);
  }

}

const molinaRouter = new MolinaRouter();
molinaRouter.routes();

export default molinaRouter.router;


import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { LoginComponent } from './componentes/login/login.component';
import { HomeComponent } from './componentes/home/home.component';
import {ProductosComponent} from './componentes/productos/productos.component';
import { InsproductComponent } from './componentes/insproduct/insproduct.component';
import { UpdproductComponent } from './componentes/updproduct/updproduct.component';
import { ProvedoresComponent } from './componentes/provedores/provedores.component';
import { CorreosProComponent } from './componentes/correos-pro/correos-pro.component';
import { TelefonosProComponent } from './componentes/telefonos-pro/telefonos-pro.component';
import { InsproveedorComponent } from './componentes/insproveedor/insproveedor.component';
import { UpdtproveedorComponent } from './componentes/updtproveedor/updtproveedor.component';
const routes: Routes = [

  {
    path: '',
    component: LoginComponent
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'home/:nombre/:usuario',
    component: HomeComponent
  },
  {
    path: 'productos',
    component: ProductosComponent
  },
  {
    path: 'add/productos',
    component: InsproductComponent
  },
  {
    path: 'modificar/productos/:codigo',
    component: UpdproductComponent
  },
   {
    path: 'proveedores',
    component: ProvedoresComponent
  },
  {
   path: 'proveedores/correos/:id',
   component: CorreosProComponent
 },
 {
  path: 'proveedores/telefonos/:id',
  component: TelefonosProComponent
},
{
 path: 'add/proveedores',
 component: InsproveedorComponent
},
{
 path: 'modificar/proveedores/:id',
 component: UpdtproveedorComponent
},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

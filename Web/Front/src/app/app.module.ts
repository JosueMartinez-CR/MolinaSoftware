import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { MatSliderModule } from '@angular/material/slider';
import {MaterialModule} from './material.modules';


import { FormsModule } from '@angular/forms'  
import { ReactiveFormsModule} from '@angular/forms' 


import { HttpClientModule } from '@angular/common/http';
import {HttpClient } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './componentes/login/login.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomeComponent } from './componentes/home/home.component';
import { ProductosComponent } from './componentes/productos/productos.component';
import { InsproductComponent } from './componentes/insproduct/insproduct.component';
import { UpdproductComponent } from './componentes/updproduct/updproduct.component';
import { ProvedoresComponent } from './componentes/provedores/provedores.component';
import { TelefonosProComponent } from './componentes/telefonos-pro/telefonos-pro.component';
import { CorreosProComponent } from './componentes/correos-pro/correos-pro.component';
import { InsproveedorComponent } from './componentes/insproveedor/insproveedor.component';
import { UpdtproveedorComponent } from './componentes/updtproveedor/updtproveedor.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    ProductosComponent,
    InsproductComponent,
    UpdproductComponent,
    ProvedoresComponent,
    TelefonosProComponent,
    CorreosProComponent,
    InsproveedorComponent,
    UpdtproveedorComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatSliderModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule,
  ],
  providers: [HttpClient],
  bootstrap: [AppComponent]
})
export class AppModule { }

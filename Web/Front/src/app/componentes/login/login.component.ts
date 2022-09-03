import { Component, OnInit, Injectable } from '@angular/core';
import { DataService } from 'src/app/data.service';
import { FormBuilder } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2'
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.css','./header.css']
})
export class LoginComponent implements OnInit {

  constructor(public dataService: DataService, private formBuilder: FormBuilder, private router: Router, private route: ActivatedRoute) { }

    codigo: any;
    tipoUser: any;
   
    confirmation: any;
    nombre:any;
  ngOnInit(): void {
  }


   registerForm = this.formBuilder.group({
    codigo: [""]
  });



  log() {
    console.log(this.registerForm);
    this.codigo = (this.registerForm.value.codigo);
    if(this.codigo.charAt(0) =="E"){
      this.tipoUser = 0
    }
    else {
      this.tipoUser = 1
    }

    if (this.codigo == "") {
      Swal.fire({
        icon: 'warning',
        text: 'Debes completar ambos campos.',
      })
    }
    else {
      this.dataService.login_Confirmation(
        this.codigo,
        this.tipoUser
      )
        .subscribe(cliente => {
          this.confirmation = cliente;
          if (this.confirmation[0].nombre != "no existe") {
            // console.log(this.confirmation)
            this.nombre = this.confirmation[0].nombre;
            console.log(this.nombre)

            this.router.navigate(['/home', this.nombre,this.tipoUser]);
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'No estás registrado!',
            })
          }

        })

      }

  }  
      async  login_Confirmation(codigo: string, tipoTrabajador: number) {
        this.dataService. login_Confirmation(codigo, tipoTrabajador).
          toPromise().
          then((res: any) => {
            console.log("HOLA "+res);
            if (res[0].code == 200) {
              Swal.fire(`Welcome`);
            }
          }, (error) => {
            alert(error.message);
          });
      }


}

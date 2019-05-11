import { Component } from '@angular/core';
import { Credentials } from 'src/app/models/credentials';
import { LoginService } from 'src/app/services/login.service';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user';
import swal from 'sweetalert';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.css']
})
export class LoginComponent {

    public credentials = new Credentials();
    
    public user : User;

    constructor(private loginService: LoginService, private router: Router) { }

    public login(): void {
        const observable = this.loginService.isExist(this.credentials);
        observable.subscribe(user => { //success.
        this.user = user;
        this.router.navigate(["home"]);
        swal("You are Logged in", "Have fun 🤩", "success");
    }, response => { swal ( "Oops" ,  "Incorrect Username or Password" ,  "error" );//Errors from server.
        });
    }
}




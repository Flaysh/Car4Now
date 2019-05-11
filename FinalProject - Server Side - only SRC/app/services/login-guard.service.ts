import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({
    providedIn: 'root'
})
export class LoginGuardService implements CanActivate {

    public constructor(private router: Router){}

    public canActivate(): boolean {
        if(sessionStorage.getItem("IsLoggedIn")) {
            return true;
        }
        this.router.navigate(["/login"]);
        return false;
    }
}

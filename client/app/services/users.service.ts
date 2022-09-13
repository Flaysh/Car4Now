import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/user';

@Injectable({
    providedIn: 'root'
})
export class UsersService {

    public constructor(private http: HttpClient) { }

    public getAllUsers(): Observable<User[]> {
        return this.http.get<User[]>("http://localhost:57923/api/users");
    }

    public getOneUser(userid: number): Observable<User> {
        return this.http.get<User>("http://localhost:57923/api/users/" + userid);
    }

    public addUser(user: User): Observable<User> {
        /*   var options = { headers: new HttpHeaders({
           'Content-Type': 'application/json'
         })}; */
        return this.http.post<User>("http://localhost:57923/api/users", user);
    }

}



import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Credentials } from 'src/app/models/credentials';
import { User } from '../models/user';
import { Observable } from 'rxjs';
// import { Store } from 'src/app/redux/store';
// import { NgRedux } from 'ng2-redux';
// import { ActionType } from 'src/app/redux/action-type';
// import { Action } from 'src/app/redux/action';

@Injectable({
    providedIn: 'root'
})

export class LoginService {

        public constructor(private http: HttpClient) { }
   
        public isExist(credentials: Credentials): Observable<User> {
          return this.http.get<User>("http://localhost:57923/api/users/"+ credentials.username + "/" + credentials.password);
            }
    }


    // export class LoginService {

//     public constructor(private http: HttpClient, private redux:NgRedux<Store>) { }

//     public isExist(credentials: Credentials): boolean {
//         if(credentials.username === "Moishe" && credentials.password === "abcd"){
//             const action = {type:ActionType.LogIn, payload: null};
//             this.redux.dispatch(action);
//             return true;
//         }
//         return false;
//     }
// }

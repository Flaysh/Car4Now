import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Car } from '../models/car';
import { Rental } from '../models/rental';
@Injectable({
  providedIn: 'root'
})
export class MainService {
  public constructor(private http: HttpClient) { }

  public getAllCars(): Observable<Car[]> {
    return this.http.get<Car[]>("http://localhost:57923/api/cars");
  }
  
  public GetCarByID(id: number): Observable<Car> {
    return this.http.get<Car>("http://localhost:57923/api/cars/" + id);
  }

  public addRental(rental: Rental): Observable<Rental> {
        // var options = { headers: new HttpHeaders({
        //   'Content-Type': 'application/json'
        // })};
    return this.http.post<Rental>("http://localhost:57923/api/rentals",rental);
}
}
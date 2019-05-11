import { Component, OnInit } from '@angular/core';
import { Car } from '../../models/car';
import { MainService } from "../../services/main.service";


@Component({
  selector: 'app-cars',
  templateUrl: './cars.component.html',
  styleUrls: ['./cars.component.css']
})
export class CarsComponent implements OnInit {

  public cars: Car[];

  public constructor(private carsService: MainService) { }

  public ngOnInit(): void {
    const observable = this.carsService.getAllCars();
    observable.subscribe(allCars => { //success.
    this.cars = allCars;
    }, response => { //Errors from server.
    });
  }
}
import { Component, OnInit, Input } from '@angular/core';
import { Rental } from 'src/app/models/rental';
import { MainService } from 'src/app/services/main.service';
import { ActivatedRoute } from '@angular/router';
import { Car } from 'src/app/models/car';
import swal from 'sweetalert';
import * as moment from 'moment';

@Component({
  selector: 'app-order-car',
  templateUrl: './order-car.component.html',
  styleUrls: ['./order-car.component.css']
})
export class OrderCarComponent implements OnInit {
  public rental = new Rental();
  car : Car;
  datestart: string;
  datefinish: string;
  diff: number;

  public constructor(private rentalService: MainService ,private activateroute : ActivatedRoute) { }

ngOnInit(): void{
let id = +this.activateroute.snapshot.params.id;
if(isNaN(id)){
  id = 0;
}
const observable = this.rentalService.GetCarByID(id);
observable.subscribe(allCarDetails => { //success.
this.car = allCarDetails;
console.log(this.car);
}, response => {
  //Errors from server.
});
}

public totalCostPerDay(): number {
  let a = moment(this.datestart, 'YYYY,MM,DD');
  let b = moment(this.datefinish, 'YYYY,MM,DD');
  this.diff = b.diff(a, 'days');
  return (this.diff * this.car.dayprice);
}

  public orderCar(): void {
    this.rental.carid =  this.car.carid;
    const observable = this.rentalService.addRental(this.rental);
    observable.subscribe(addedRental => {
      swal("Order submitted!", "Car has been succesfuly ordered.", "success");
    }, response => {// errors from server.
      swal ( "Oops" ,  "Something went wrong!" ,  "error" );
    });
  }

  }




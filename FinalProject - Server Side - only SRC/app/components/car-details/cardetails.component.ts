import { Component, OnInit, Input } from '@angular/core';
import { MainService } from "../../services/main.service";
import { Car } from '../../models/car';

@Component({
  selector: 'app-cardetails',
  templateUrl: './cardetails.component.html',
  styleUrls: ['./cardetails.component.css']
})
export class CarDetailsComponent implements OnInit {

  public cardetails: Car;

  @Input()
  public id :number;
  
  public constructor(private cardetailsService: MainService) { }

  public ngOnInit(): void {
    const observable = this.cardetailsService.GetCarByID(this.id);
    observable.subscribe(allCarDetails => { //success.
    this.cardetails = allCarDetails;
    }, response => { //Errors from server.
    });
  }
  
  public showdetails = false;
  public more(){
    this.showdetails = !this.showdetails;
  }
  public less(){
    this.showdetails = !this.showdetails;
  }
}

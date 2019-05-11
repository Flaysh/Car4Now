import { Component, OnInit } from '@angular/core';
import { Car } from '../../models/car';
import { MainService } from "../../services/main.service";
import { Ng2SmartTableModule } from 'ng2-smart-table';


@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  public cars: Car[];

  public constructor(private carsService: MainService) { }

  public ngOnInit(): void {
    const observable = this.carsService.getAllCars();
    observable.subscribe(allCars => { //success.
      this.cars = allCars;
    }, response => { //Errors from server.
    });
  }

/* data = [
  {
    carid:1,
    manufacturer:"a",
    model:"baba",
    dayprice: 500,
    latedayprice: 600,
    productionyear: 1982,
    gear: "auto"
  }
] */

  settings = {
    actions: false,
    columns: {


      manufacturer: {
        title: 'Manufacturer'
      },
      model: {
        title: 'Model'
      },
      dayprice: {
        title: 'DayPrice'
      },
      gear: {
        title: 'Gear'
      },
   image: {
          title: 'image',
          type: 'html',
          filter: false,
          valuePrepareFunction: (value) => { return '<img src= ' + value + ' height="60px" width="90px"  />' }
        }
    }
  }
}

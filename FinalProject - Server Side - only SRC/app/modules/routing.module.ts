import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from "@angular/router";
import { HomeComponent } from '../components/home/home.component';
import { AboutComponent } from '../components/about/about.component';
import { ContactUsComponent } from '../components/contact-us/contact-us.component';
import { Page404Component } from '../components/page404/page404.component';
import { RegisterComponent } from '../components/register/register.component';
import { CarDetailsComponent } from '../components/car-details/cardetails.component';
import { CarsComponent } from '../components/cars/cars.component';
import { OrderCarComponent } from '../components/order-car/order-car.component';
import { LoginComponent } from '../components/login/login.component';
import { SearchComponent } from '../components/search/search.component';

const routes: Routes = [
    { path: 'home', component: HomeComponent },
    { path: 'about', component: AboutComponent },
    { path: 'contact-us', component: ContactUsComponent },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'cardetails', component: CarDetailsComponent },
    { path: 'cars', component: CarsComponent },
    { path: 'cars/ordercar/:id', component: OrderCarComponent },
    { path: 'search', component: SearchComponent },
    { path: '', redirectTo: 'home', pathMatch: 'full' },
    { path: '**',  component: Page404Component }
];

@NgModule({
    declarations: [],
    imports: [CommonModule, RouterModule.forRoot(routes)]
})
export class RoutingModule { }

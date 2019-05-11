import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { LayoutComponent } from '../components/layout/layout.component';
import { HeaderComponent } from '../components/header/header.component';
import { FooterComponent } from '../components/footer/footer.component';
import { HomeComponent } from '../components/home/home.component';
import { SearchComponent } from '../components/search/search.component';
import { RouterModule, Routes } from "@angular/router";
import { FormsModule } from "@angular/forms";
import { HttpClientModule } from "@angular/common/http";
import { AboutComponent } from '../components/about/about.component';
import { ContactUsComponent } from '../components/contact-us/contact-us.component';
import { Page404Component } from '../components/page404/page404.component';
import { CarDetailsComponent } from '../components/car-details/cardetails.component';
import { CarsComponent } from '../components/cars/cars.component';
import { RoutingModule } from './routing.module';
import { OrderCarComponent } from '../components/order-car/order-car.component';
import { LoginComponent } from '../components/login/login.component';
import { RegisterComponent } from '../components/register/register.component';
import { Ng2SmartTableModule } from 'ng2-smart-table';


@NgModule({
    declarations: [
        LayoutComponent,
        HeaderComponent,
        FooterComponent,
        HomeComponent,
        SearchComponent,
        AboutComponent,
        Page404Component,
        ContactUsComponent,
        CarDetailsComponent,
        CarsComponent,
        OrderCarComponent,
        LoginComponent,
        RegisterComponent,
    ],
    imports: [
        BrowserModule,
        HttpClientModule,
        RouterModule,
        RoutingModule,
        FormsModule,
        Ng2SmartTableModule
    ],
    providers: [],
    bootstrap: [LayoutComponent]
})
export class AppModule { }

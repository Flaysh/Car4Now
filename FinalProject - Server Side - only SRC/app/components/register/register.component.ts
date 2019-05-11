import { Component } from '@angular/core';
import { User } from 'src/app/models/user';
import { UsersService } from 'src/app/services/users.service';
import { NgForm } from '@angular/forms';
// import { ToastrService } from 'ngx-toastr'
import swal from 'sweetalert';



@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent  {

  public user = new User();

  public constructor(private userService: UsersService) { }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.user = {
      username: '',
      password: '',
      email: '',
      fullname: '',
      gender: ''
    }
  }

  public OnSubmit(form: NgForm): void {
    const observable = this.userService.addUser(this.user);
    observable.subscribe(addedUser => {
      console.log(addedUser);
      swal("User Registered!", "You are sign up", "success");

    }, response => {// errors from server.
      swal("Somthing Went Wrong!", "Check your details...", "error");
    });
   
  }
  public ForgotPassword(){
    swal("Dont Worry!", "No one cares!", "error");
  }

 /*  OnSubmit(form: NgForm) {
    console.log(this.user);
    this.userService.addUser(form.value)
      .subscribe((data: any) => {
        if (data.Succeeded == true) {
          this.resetForm(form);
          this.toastr.success('User registration successful');
        }
        else
          this.toaster.error(data.Errors[0]);
      });
  } */

}

  
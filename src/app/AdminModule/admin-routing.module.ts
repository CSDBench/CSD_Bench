import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './admin-home/admin-home.component';
import { NewOrderComponent } from './raw-material-order/rawmaterialorder.component';

const routes: Routes = [
  { path: "home", component: AdminHomeComponent },
  { path: "rawmaterialorder", component: NewOrderComponent},
  { path: "**", redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }



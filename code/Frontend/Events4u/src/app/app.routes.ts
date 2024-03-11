import { Routes } from '@angular/router';
import { EventsListComponent } from './events-list/events-list.component';
import { EventDetailsComponent } from './event-details/event-details.component';
import { EventAddComponent } from './event-add/event-add.component';
import { EventUpdateComponent } from './event-update/event-update.component';
import { MyEventsComponent } from './my-events/my-events.component';
import { EventsLocationComponent } from './events-location/events-location.component';
import { MyGroupsComponent } from './my-groups/my-groups.component';
import { GroupEditComponent } from './group-edit/group-edit.component';
import { LogComponent } from './log/log.component';
import { GroupEventsComponent } from './group-events/group-events.component';
import { EventCopyComponent } from './event-copy/event-copy.component';
import { AttendedEventsComponent } from './attended-events/attended-events.component';
import { LoginComponentComponent } from './login-component/login-component.component';
import { RegisterComponentComponent } from './register-component/register-component.component';

export const routes: Routes = [
    {path: 'event/add', component: EventAddComponent },                     //Done
    {path: 'event/update/:id', component: EventUpdateComponent },           //Done
    {path: 'events', component: EventsListComponent},                       //Done
    {path: 'event/:id', component: EventDetailsComponent },                 //Done
    {path: 'myEvents', component: MyEventsComponent },                      //Done
    {path: 'event/location/:id', component: EventsLocationComponent },      //Done
    {path: 'myGroups', component: MyGroupsComponent },                      //Done
    {path: 'group/edit/:id', component: GroupEditComponent },               //Done        
    {path: 'log', component: LogComponent },                                //TODO
    {path: 'group/events/:id', component: GroupEventsComponent },           //Done
    {path: 'event/copy/:id', component: EventCopyComponent },               //Done
    {path: 'events/attended', component: AttendedEventsComponent },         //Done
    {path: 'login', component: LoginComponentComponent },                   //Done
    {path: 'register', component: RegisterComponentComponent },             //Done
   
    { path: '', redirectTo: 'events', pathMatch: 'full' },

];

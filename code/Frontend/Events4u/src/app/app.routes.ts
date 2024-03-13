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
    {path: 'event/add', component: EventAddComponent },                     
    {path: 'event/update/:id', component: EventUpdateComponent },           
    {path: 'events', component: EventsListComponent},                       
    {path: 'event/:id', component: EventDetailsComponent },                 
    {path: 'myEvents', component: MyEventsComponent },                      
    {path: 'event/location/:id', component: EventsLocationComponent },      
    {path: 'myGroups', component: MyGroupsComponent },                      
    {path: 'group/edit/:id', component: GroupEditComponent },               
    {path: 'log', component: LogComponent },                                
    {path: 'group/events/:id', component: GroupEventsComponent },           
    {path: 'event/copy/:id', component: EventCopyComponent },               
    {path: 'events/attended', component: AttendedEventsComponent },         
    {path: 'login', component: LoginComponentComponent },                   
    {path: 'register', component: RegisterComponentComponent },             
   
    { path: '', redirectTo: 'events', pathMatch: 'full' },

];

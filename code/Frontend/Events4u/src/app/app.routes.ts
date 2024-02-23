import { Routes } from '@angular/router';
import { EventsListComponent } from './events-list/events-list.component';
import { EventDetailsComponent } from './event-details/event-details.component';
import { EventAddComponent } from './event-add/event-add.component';

export const routes: Routes = [
    {path: 'event/add', component: EventAddComponent },
    {path: 'events', component: EventsListComponent},
    {path: 'event/:id', component: EventDetailsComponent },
   
    { path: '', redirectTo: 'events', pathMatch: 'full' }
];

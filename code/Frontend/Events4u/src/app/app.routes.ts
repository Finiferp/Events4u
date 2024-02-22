import { Routes } from '@angular/router';
import { EventsListComponent } from './events-list/events-list.component';
import { EventDetailsComponent } from './event-details/event-details.component';
export const routes: Routes = [
    {path: 'events', component: EventsListComponent},
    {path: 'event/:id', component: EventDetailsComponent },

    { path: '', redirectTo: 'events', pathMatch: 'full' }
];

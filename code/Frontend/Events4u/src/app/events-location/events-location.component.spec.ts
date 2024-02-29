import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EventsLocationComponent } from './events-location.component';

describe('EventsLocationComponent', () => {
  let component: EventsLocationComponent;
  let fixture: ComponentFixture<EventsLocationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EventsLocationComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EventsLocationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

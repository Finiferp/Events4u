import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AttendedEventsComponent } from './attended-events.component';

describe('AttendedEventsComponent', () => {
  let component: AttendedEventsComponent;
  let fixture: ComponentFixture<AttendedEventsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AttendedEventsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AttendedEventsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

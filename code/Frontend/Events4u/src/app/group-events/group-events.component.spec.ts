import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupEventsComponent } from './group-events.component';

describe('GroupEventsComponent', () => {
  let component: GroupEventsComponent;
  let fixture: ComponentFixture<GroupEventsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GroupEventsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(GroupEventsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

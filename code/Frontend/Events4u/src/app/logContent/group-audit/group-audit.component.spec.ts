import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GroupAuditComponent } from './group-audit.component';

describe('GroupAuditComponent', () => {
  let component: GroupAuditComponent;
  let fixture: ComponentFixture<GroupAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GroupAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(GroupAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

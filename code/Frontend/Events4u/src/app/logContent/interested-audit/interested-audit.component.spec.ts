import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InterestedAuditComponent } from './interested-audit.component';

describe('InterestedAuditComponent', () => {
  let component: InterestedAuditComponent;
  let fixture: ComponentFixture<InterestedAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InterestedAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(InterestedAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

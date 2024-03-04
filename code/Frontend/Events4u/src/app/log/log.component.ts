import { Component } from '@angular/core';
import { BelongsAuditComponent } from '../logContent/belongs-audit/belongs-audit.component';
import { CategoryAuditComponent } from '../logContent/category-audit/category-audit.component';
import { EventAuditComponent } from '../logContent/event-audit/event-audit.component';
import { FavoriteAuditComponent } from '../logContent/favorite-audit/favorite-audit.component';
import { GroupAuditComponent } from '../logContent/group-audit/group-audit.component';
import { LocationAuditComponent } from '../logContent/location-audit/location-audit.component';
import { PartOfAuditComponent } from '../logContent/part-of-audit/part-of-audit.component';
import { ReviewAuditComponent } from '../logContent/review-audit/review-audit.component';
import { UserAuditComponent } from '../logContent/user-audit/user-audit.component';
import { ViewAuditComponent } from '../logContent/view-audit/view-audit.component';

@Component({
  selector: 'app-log',
  standalone: true,
  imports: [BelongsAuditComponent, CategoryAuditComponent, EventAuditComponent, FavoriteAuditComponent, GroupAuditComponent, LocationAuditComponent, PartOfAuditComponent, ReviewAuditComponent, UserAuditComponent, ViewAuditComponent],
  templateUrl: './log.component.html',
  styleUrl: './log.component.scss'
})
export class LogComponent {

}

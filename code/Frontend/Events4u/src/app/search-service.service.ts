import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class SearchServiceService {
  private subject = new Subject<any>();
  sendSearchParam(inputData: any) {
    this.subject.next(inputData);
  }

  getSearchEvent(): Observable<any>{ 
    return this.subject.asObservable();
  }
  
}

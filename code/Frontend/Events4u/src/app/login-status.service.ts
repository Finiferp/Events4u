import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class LoginStatusService {

  private subject = new Subject<any>();
  constructor() { }

  sendLoginStatus(inputData: any) {
    this.subject.next(inputData);
  }


  getLoginStatus(): Observable<any> {
    return this.subject.asObservable();
  }
}

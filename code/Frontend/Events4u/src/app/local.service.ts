import { Injectable } from '@angular/core';


@Injectable({
  providedIn: 'root'
})
export class LocalService {

  constructor() { }

  public setItem(key: string, value: string) {
    localStorage.setItem(key, value);
  }

  public getItem(key: string) {
    if (typeof localStorage !== 'undefined') {
      return localStorage.getItem(key);
    }else {
      return '';
    }
  }

  public removeItem(key: string) {
    localStorage.removeItem(key);
  }

  public clear() {
    localStorage.clear();
  }
}

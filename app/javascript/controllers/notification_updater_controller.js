import { Controller } from "@hotwired/stimulus"
let currently_logedin = false;
let loop = undefined;
// Connects to data-controller="notification-updater"
export default class extends Controller {
  static targets = ["allNotifications", "loanNotifications", "borrowNotifications"]
  static values = { path: String, logedin: Boolean }

  refresh() {
    fetch(this.pathValue, {
      method: "GET", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        if(typeof data.main_notifications != "undefined") {
          this.allNotificationsTarget.innerHTML = data.main_notifications
        }
        if(data.borrow_notifications !== 0) {
          this.borrowNotificationsTarget.innerText = ` (${data.borrow_notifications})`
        } else {
          this.borrowNotificationsTarget.innerText = ""
        }
        if(data.loan_notifications !== 0) {
          this.loanNotificationsTarget.innerText = ` (${data.loan_notifications})`
        } else {
          this.loanNotificationsTarget.innerText = ""
        }
      })
  }

  start() {
    loop = setInterval(() => {this.refresh()}, 1000);
  }

  connect() {
    currently_logedin = this.logedinValue;
    if(currently_logedin){
      this.start();
      console.log("loop started again");
    }
  }
  stop(event) {
    console.log("Pressed Logout to stop loop");
    currently_logedin = false;
    clearInterval(loop);
  }
}

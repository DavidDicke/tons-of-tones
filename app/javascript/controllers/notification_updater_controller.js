import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification-updater"
export default class extends Controller {
  static values = { path: String }

  connect() {
    setInterval(refresh, 1000);
  }
  refresh() {
    fetch(this.pathValue, {
      method: "GET", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        this.element.insertAdjacentHTML("beforeend", data.inserted_item)
      })
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-cta"
export default class extends Controller {
  static targets = ["dateRangePrev", "startDateModal", "endDateModal", "totalPrice"]
  static values =  { price: Number }
  connect() {
  const options = {
    month: "short",
    day: "numeric"
  }
  const startDate = new Date(this.startDateModalTarget.value)
  const endDate = new Date(this.endDateModalTarget.value)
  const duration = (endDate - startDate) / (1000 * 60 * 60 * 24)
  this.dateRangePrevTarget.innerText = `${startDate.toLocaleDateString("en-US", options)} - ${endDate.toLocaleDateString("en-US", options)}`
  this.totalPriceTarget.innerText = `${ duration * this.priceValue } €`
  }
}
// toLocaleDateString("en-US", options)} -

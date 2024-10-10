import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    unavailableDates: Array // Declare a value to receive unavailable dates
  };

  connect() {
    flatpickr(this.element, {
      mode: "multiple",
      minDate: "today",
      dateFormat: "Y-m-d",
      disable: this.unavailableDatesValue // Use the unavailable dates passed to the controller
    });
  }
}

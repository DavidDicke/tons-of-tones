import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["notif"];

  notificationDisplayed = false;

  connect() {
    console.log("Booking notifications controller connected");
    this.refresh();
    this.interval = setInterval(() => this.refresh(), 1000); // every second
  }

  disconnect() {
    clearInterval(this.interval); // Clean up when the controller is disconnected
  }

  async hasNewConfirmation() {
    try {
      const response = await fetch('/bookings/confirmed');
      const bookings = await response.json();
      console.log("Confirmed bookings fetched:", bookings);
      return bookings.length > 0; // Return true if there are confirmed bookings
    } catch (error) {
      console.error('Error fetching confirmed bookings:', error);
      return false;
    }
  }

  async refresh() {
    if (await this.hasNewConfirmation()) {
      // Only append notification if it hasn't been displayed yet
      if (!this.notificationDisplayed) {
        this.appendNotificationToDom();
        this.notificationDisplayed = true; // Mark as displayed
      }
    } else {
      this.notificationDisplayed = false; // Reset if no new confirmations
    }
  }

  appendNotificationToDom() {
    // Create the notification HTML with a link to refresh the page
    const notificationHTML = `
      <div class="notification">
        <a href="#" class="notification-link" role="button">
          <i class="fa-solid fa-message"></i>
        </a>
      </div>
    `;
    this.notifTarget.insertAdjacentHTML('afterbegin', notificationHTML); // Append new notification

    // Add a click event listener to refresh the page when clicked
    const notificationLink = this.notifTarget.querySelector('.notification-link');
    notificationLink.addEventListener('click', (event) => {
      event.preventDefault();
      location.reload(); // Refresh the current page
    });
  }
}

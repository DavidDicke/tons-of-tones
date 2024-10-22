// app/javascript/controllers/booking_notifications_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["notif"];

  // Variable to keep track of whether the notification is already displayed
  notificationDisplayed = false;

  connect() {
    console.log("Booking notifications controller connected");
    this.refresh(); // Start immediately
    this.interval = setInterval(() => this.refresh(), 1000); // Poll every second
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
    // Create the notification HTML with a link
    const notificationHTML = `
      <div class="notification">
        <a href="#" class="notification-link" role="button">
          <i class="fa-solid fa-message"></i>
        </a>
      </div>
    `;
    this.notifTarget.insertAdjacentHTML('afterbegin', notificationHTML); // Append new notification

    // Add a click event listener to remove the notification when clicked
    const notificationLink = this.notifTarget.querySelector('.notification-link');
    notificationLink.addEventListener('click', (event) => {
      event.preventDefault(); // Prevent the default anchor click behavior
      this.removeNotification(notificationLink); // Call the function to remove the notification
    });
  }

  removeNotification(notification) {
    // Remove the notification element from the DOM
    notification.parentElement.remove(); // Remove the parent div of the notification link
  }
}

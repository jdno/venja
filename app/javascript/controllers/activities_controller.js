import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["activity", "grid"];

  create(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    fetch(this.activityTarget.getAttribute("href"), {
      method: "POST",
      headers: this.headers()
    })
      .then(response => response.text())
      .then(html => (this.gridTarget.innerHTML = html))
      .catch(error => console.log(error));
  }

  destroy(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    fetch(this.activityTarget.getAttribute("href"), {
      method: "DELETE",
      headers: this.headers()
    })
      .then(response => response.text())
      .then(html => (this.gridTarget.innerHTML = html))
      .catch(error => console.log(error));
  }

  headers() {
    return {
      Accept: "application/json",
      "X-CSRF-Token": this.getMetaValue("csrf-token")
    };
  }

  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`);
    return element ? element.getAttribute("content") : "";
  }
}

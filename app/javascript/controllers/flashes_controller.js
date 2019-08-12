import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["flash"];

  hide() {
    if (this.hasFlashTarget) {
      this.flashTarget.parentNode.removeChild(this.flashTarget);
    }
  }
}

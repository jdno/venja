import { Controller } from "stimulus";
import { library, dom } from "@fortawesome/fontawesome-svg-core";

export default class extends Controller {
  initialize() {
    library.add();
  }

  connect() {
    dom.i2svg();
  }
}

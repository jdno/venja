import { Controller } from "stimulus";
import { library, dom } from "@fortawesome/fontawesome-svg-core";
import {
  faCheckCircle,
  faExclamationCircle,
  faInfoCircle,
  faTimes
} from "@fortawesome/free-solid-svg-icons";

export default class extends Controller {
  initialize() {
    library.add(faCheckCircle, faExclamationCircle, faInfoCircle, faTimes);
  }

  connect() {
    dom.i2svg();
  }
}

import { Controller } from "stimulus";
import { library, dom } from "@fortawesome/fontawesome-svg-core";
import {
  faAngleLeft,
  faAngleRight,
  faCheckCircle,
  faExclamationCircle,
  faInfoCircle,
  faPencilAlt,
  faPlus,
  faTimes,
  faTrashAlt
} from "@fortawesome/free-solid-svg-icons";

export default class extends Controller {
  initialize() {
    library.add(
      faAngleLeft,
      faAngleRight,
      faCheckCircle,
      faExclamationCircle,
      faInfoCircle,
      faPencilAlt,
      faPlus,
      faTimes,
      faTrashAlt
    );
  }

  connect() {
    dom.i2svg();
  }
}

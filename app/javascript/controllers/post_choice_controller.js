import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["display"]

  connect() {
    //console.log(this.formTarget)
    //console.log(this.oneshotTarget)
    //console.log(this.listTarget)
  }

  showperiodicity() {
    // console.log(this.displayTarget)
    this.displayTarget.classList.remove("d-none");
    console.log(this.displayTarget);
  }

  showdate() {
    this.displayTarget.classList.add("d-none");
    console.log(this.displayTarget);
  }

}

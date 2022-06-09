import { end } from "@popperjs/core";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["choice", "date", "periodicity"]

  connect() {
    console.log("connected to my controller")
  }

  displayfield() {
      console.log("display field");
      const selection = this.choiceTarget.value;
      if (selection === 'One time') {
        this.dateTarget.classList.remove("d-none");
        this.periodicityTarget.classList.add("d-none");

      } else {
        this.periodicityTarget.classList.remove("d-none");
        this.dateTarget.classList.add("d-none");
      }

  }



}

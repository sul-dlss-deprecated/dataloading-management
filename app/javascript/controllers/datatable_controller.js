import { Controller } from "@hotwired/stimulus"
import "simple-datatables"

export default class extends Controller {
  static values = {
    perPage: { type: Number, default: 50 },
    perPageSelect: { type: Boolean, default: false }
  }

  connect() {
    new simpleDatatables.DataTable(this.element,
      {
        perPage: this.perPageValue,
        perPageSelect: this.perPageSelectValue,
      });
  }
}

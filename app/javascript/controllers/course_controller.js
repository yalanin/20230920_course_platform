import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['unit_template', 'unit_link']

  add_unit(event) {
    event.preventDefault();

    let content = this.unit_templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.unit_linkTarget.insertAdjacentHTML('beforebegin', content);
  }

  remove_unit(event) {
    event.preventDefault();

    let record = event.target.closest('.nested-unit-fields');
    record.remove();
  }
}
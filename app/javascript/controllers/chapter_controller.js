import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['chapter_template', 'chapter_link']

  add_chapter(event) {
    event.preventDefault();

    let content = this.chapter_templateTarget.innerHTML.replace(/NEW_CHAPTER/g, new Date().getTime());
    this.chapter_linkTarget.insertAdjacentHTML('beforebegin', content);
  }

  remove_chapter(event) {
    event.preventDefault();

    let record = event.target.closest('.nested-chapter-fields');
    record.remove();
  }
}
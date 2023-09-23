import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['modal', 'content']

  trigger(event) {
    event.preventDefault();

    var id = event.target.getAttribute('data-cid');
    fetch(`/courses/${id}/details`, {
      headers: { accept: "application/json" },
      method: "GET"
    }).then(response => response.json())
      .then((data) => {
        var text = addDetailOptions(data.res);
        this.contentTarget.append(text);
      })
    this.modalTarget.classList.toggle('is-active');
  }

  close(event) {
    event.preventDefault();
    this.modalTarget.classList.toggle('is-active');
  }
}

function addDetailOptions(data) {
  var div = document.createElement("div");
  data.forEach((e) => {
    var first = document.createElement("p");
    first.setAttribute("class", "title is-5");
    first.innerHTML = e[0];
    div.append(first);
    e[1].forEach((ee) => {
      var second = document.createElement("p");
      second.innerHTML = ee;
      div.append(second);
    })
  })
  return div;
}
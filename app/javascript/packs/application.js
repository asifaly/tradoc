/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Rails functionality
window.Rails = require("@rails/ujs");
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("trix");
require("@rails/actiontext");

// Tailwind CSS
import "stylesheets/application";
import "flatpickr/dist/themes/airbnb.css";

// Stimulus controllers
import "controllers";

// Jumpstart Pro & other Functionality
import "src/actiontext";
import "src/confirm";
import "src/direct_uploads";
import "src/forms";
import "src/timezone";
import "src/tooltips";

import LocalTime from "local-time";
LocalTime.start();

// ADD YOUR JAVACSRIPT HERE

// ./packs/application.js
import { Application } from "stimulus";
// import Flatpickr
import Flatpickr from "stimulus-flatpickr";

import { definitionsFromContext } from "stimulus/webpack-helpers";
const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// Manually register Flatpickr as a stimulus controller
application.register("flatpickr", Flatpickr);

document.addEventListener(
  "turbolinks:load",
  () =>
    setTimeout(function() {
      document.getElementById("notice") !== null
        ? document.getElementById("notice").remove()
        : "";
      document.getElementById("alert") !== null
        ? document.getElementById("alert").remove()
        : "";
    }, 3000),
  {
    once: true
  }
);

// Called after every non-initial page load
document.addEventListener("turbolinks:render", () =>
  setTimeout(function() {
    document.getElementById("notice") !== null
      ? document.getElementById("notice").remove()
      : "";
    document.getElementById("alert") !== null
      ? document.getElementById("alert").remove()
      : "";
  }, 3000)
);

addEventListener("direct-upload:initialize", event => {
  const { target, detail } = event;
  const { id, file } = detail;
  target.insertAdjacentHTML(
    "beforebegin",
    `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">${file.name}</span>
    </div>
  `
  );
});

addEventListener("direct-upload:start", event => {
  const { id } = event.detail;
  const element = document.getElementById(`direct-upload-${id}`);
  element.classList.remove("direct-upload--pending");
});

addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail;
  const progressElement = document.getElementById(
    `direct-upload-progress-${id}`
  );
  progressElement.style.width = `${progress}%`;
});

addEventListener("direct-upload:error", event => {
  event.preventDefault();
  const { id, error } = event.detail;
  const element = document.getElementById(`direct-upload-${id}`);
  element.classList.add("direct-upload--error");
  element.setAttribute("title", error);
});

addEventListener("direct-upload:end", event => {
  const { id } = event.detail;
  const element = document.getElementById(`direct-upload-${id}`);
  element.classList.add("direct-upload--complete");
});

// Start Rails UJS
Rails.start();

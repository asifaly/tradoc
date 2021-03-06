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
require('jquery')
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
// Start Rails UJS
Rails.start();

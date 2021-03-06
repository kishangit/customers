// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'

$('.alert').alert('close');

$( document ).ready(function() {
  $('#upload-btn').on("click", function(event) {
    if (attachment_file.files.length < 1) {
      alert('Please select file');
      event.preventDefault();
    } else if (attachment_file.files[0].type.indexOf('csv') < 0) {
      alert('Please select csv file');
      document.getElementById("attachment_file").value = "";
      event.preventDefault();
    } else {
      loader.style.display = 'block';
    }
  });
});

window.hideAlert = function(ele){
  ele.parentElement.style.display = 'none';
}

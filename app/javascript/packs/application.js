// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "bootstrap"

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

// window.$crisp=[];window.CRISP_WEBSITE_ID="e93e073a-1f69-4cbc-8934-f9e1611e65bb";
// (function(){
//   d=document;s=d.createElement("script");
//   s.src="https://client.crisp.chat/l.js";
//   s.async=1;d.getElementsByTagName("head")[0].appendChild(s);})();

window.$crisp.push(["set", "message:text", ["Hi! I'd like to get help."]]);

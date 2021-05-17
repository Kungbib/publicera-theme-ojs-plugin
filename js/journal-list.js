// vanilla JS
// init with element
// var grid = document.querySelector('.grid');
// var msnry = new Masonry( grid, {
//   // options...
//   itemSelector: '.grid-item',
//   columnWidth: 200
// });

// init with selector
var msnry = new Masonry( '.journals-list', {
  itemSelector: '.journal',
  // columnWidth: '.journal-sizer',
  percentPosition: true,
  transitionDuration: 0,
});

function resizeResponse() {
  msnry.layout();
}

window.onresize = resizeResponse;
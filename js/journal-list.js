
var msnry = new Masonry( '.journals-list', {
  itemSelector: '.journal-container',
  columnWidth: '.journal-sizer',
  percentPosition: true,
  transitionDuration: 0,
});

function resizeResponse() {
  // console.log("Updating masonry");
  msnry.layout();
}

window.onresize = resizeResponse;
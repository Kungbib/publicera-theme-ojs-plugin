
var msnry = new Masonry( '.journals-list', {
  itemSelector: '.journal-container',
  columnWidth: '.journal-sizer',
  percentPosition: true,
  transitionDuration: 0,
});

function resizeResponse() {
  // console.log("Updating masonry");
  var container = document.getElementsByClassName('.journal-container');
  if (container.length > 0) {
    msnry.layout();
  }
}

window.onresize = resizeResponse;
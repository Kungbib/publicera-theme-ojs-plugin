var collapseAbout = document.getElementById('collapseAbout');
var collapseAboutIcon = document.getElementById('collapseAboutIcon');
collapseAbout.addEventListener('show.bs.collapse', function () {
  collapseAboutIcon.classList.add("rotate-180");
})
collapseAbout.addEventListener('hide.bs.collapse', function () {
  collapseAboutIcon.classList.remove("rotate-180");
})
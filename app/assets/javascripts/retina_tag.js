function highdpi_init() {
  if(window.devicePixelRatio > 1)
  {

    var els = jQuery("img").get();
    for(var i = 0; i < els.length; i++) {
      var hiDpiSrc = $(els[i]).attr('hidpi_src');
      var src = els[i].src;

      if(hiDpiSrc)
      {
        src = hiDpiSrc;
      }


      if(hiDpiSrc) {
        els[i].src = hiDpiSrc;
      }



    }
  }
}

$(document).ready(function() {
  highdpi_init();
});

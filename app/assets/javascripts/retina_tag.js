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
      else
      {
        var path_segments = src.split('.');
        var path_without_extension = path_segments.slice(0, (path_segments.length - 1)).join(".");
        var extension = path_segments[path_segments.length - 1];
        src = path_without_extension + "@2x." + extension;
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

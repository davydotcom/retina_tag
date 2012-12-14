var RetinaTag = RetinaTag || {};

RetinaTag.init = function() {
  RetinaTag.updateImages();
  RetinaTag.interval = setInterval(RetinaTag.updateImages,50);
};

RetinaTag.updateImages = function() {
  var images = document.getElementsByTagName('img');
  for(var counter=0; counter < images.length; counter++) {
    RetinaTag.refreshImage(images[counter]);
  }
};

RetinaTag.refreshImage = function(image) {
  var lazyLoad  = image.getAttribute('data-lazy-load');
  var imageSrc  = image.src;
  var hiDpiSrc  = image.getAttribute('hidpi_src');
  var lowDpiSrc = image.getAttribute('lowdpi_src');
  if(!hiDpiSrc) {
    return;
  }

  if(window.devicePixelRatio > 1 && imageSrc != hiDpiSrc) {
    if(!lowDpiSrc) {
      image.setAttribute('lowdpi_src',imageSrc);
    }
    if(lazyLoad) {
      lazyLoad.setAttribute('data-lazy-load','2x');
    }
    else {
      image.src = hiDpiSrc;
    }

  }
  else if(window.devicePixelRatio <= 1 && (imageSrc == hiDpiSrc || (lowDpiSrc && imageSrc != lowDpiSrc))) {
    if(lazyLoad) {
      lazyLoad.setAttribute('data-lazy-load','1x');
    }
    else {
      image.src = lowDpiSrc;
    }
  }
};

RetinaTag.init();

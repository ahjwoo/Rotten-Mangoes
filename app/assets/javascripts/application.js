// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $('.movie-slider').slick({
    slidesToShow: 6,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 1500,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 4,
          slidestoScroll: 1,
          autoplay: true,
          autoplaySpeed: 1500
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidestoScroll: 1,
          autoplay: true,
          autoplaySpeed: 1500
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 2,
          slidestoScroll: 1,
          autoplay: true,
          autoplaySpeed: 1500
        }
      }
    ]
  });
});


$(document).ready(function(){
  $('.navbar-brand').on('click', function(){
    window.location.href = "/";
  });
  $('#backtomovies').on('click', function(){
    window.location.href = "/";
  });
});
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require moment
//= require moment/ja.js
//= require cocoon
//= require bootstrap-datetimepicker
//= require_tree .

$(function(){
  $('.datepicker').datetimepicker({
    format : "YYYY/MM/DD",
    // startView: "months", 
    // minViewMode: "months"
    icons: {
      previous: "fa fa-arrow-left",
      next: "fa fa-arrow-right"
    }
  });
  $('.datetimepicker').datetimepicker({
    format : "YYYY/MM/DD",
    // startView: "months", 
    // minViewMode: "months"
    icons: {
      time: "fa fa-clock-o",
      date: "fa fa-calendar",
      up: "fa fa-arrow-up",
      down: "fa fa-arrow-down",
      previous: "fa fa-arrow-left",
      next: "fa fa-arrow-right"
    }
  });
});

$(function() {
  $('#login-show').click(function(){
    $('#login-modal').fadeIn();
  });
  
  $('.signup-show').click(function(){
    $('#signup-modal').fadeIn();
  });
  
  // 「.close-modal」要素にclickイベントを設定してください
  $(".close-modal").click(function(){
    $("#login-modal").fadeOut();
    $("#signup-modal").fadeOut();
  });  
});

$('.dropdown-toggle').dropdown()
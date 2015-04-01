//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery.turbolinks
//= require jquery.countdown.min
//= require_tree .


function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function remove_option_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".option-fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function check_only_one_checkbox(checkbox) {
  $(checkbox).closest(".options").find("input[type='checkbox']")
    .not(this).prop("checked", false);
  $(checkbox).prop("checked", true)
}

$(document).ready(function(){
  var data_timer_exam = $("#getting-started").data('timer-exam');
  var timer = localStorage.getItem('id_' + data_timer_exam) || 0;
  if (timer <= $("#getting-started").data('time')) {
    if (timer != 0) {
    $("#getting-started").html('Full Time').parent().parent().next()
      .next().find('.btn-primary').remove();
       localStorage.clear();
    }
    else {
      $("#getting-started").html('Full Time').parent().parent().next()
      .next().find('.btn-primary').remove();
    }
  }
  else {
    $("#getting-started").countdown(timer, function(event) {
      $(this).text(
        event.strftime('%H:%M:%S')
      );
    }).on('finish.countdown', function(event) {
      $(this).html('Full Time').parent().parent().next()
        .next().find('.btn-primary').click();
      localStorage.clear();
      });
  }
})

$(function(){
  $(".start").click(function() {
    var timer2 = $("#getting").data('time');
    var data_timer_exam = $("#getting").data('timer-exam');
    localStorage.setItem('id_' + data_timer_exam, timer2);
  });
})

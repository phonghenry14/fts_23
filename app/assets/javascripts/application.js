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
  var data_id_exam = $("#getting-started").data('id-exam');
  var timer = localStorage.getItem('id_' + data_id_exam) || 0;
  if (timer == 0) {
    $("#getting-started").html('Full Time').parent().parent().next()
      .next().find('.btn-primary').remove();
  }
  else {
    $("#getting-started").countdown(timer, function(event) {
      $(this).text(
        event.strftime('%H:%M:%S')
      );
    }).on('finish.countdown', function(event) {
      $(this).html('Full Time').parent().parent().next()
        .next().find('.btn-primary').remove();
      localStorage.clear();
    });
  }
})

$(function(){
  $(".start").click(function() {
    var timer2 = $("#getting").data('time');
    var data_id_exam = $("#getting").data('id-exam');
    localStorage.setItem('id_' + data_id_exam, timer2);

    $.ajax({
      url: "/examinations/" + data_id_exam,
      type: 'PUT',
    });
  });

  $("#start-new").click(function() {
    localStorage.clear();
  });

  $('#courses').click(function() {
    var item = $("#courses");
    selectedItem = $("#courses").val();
    $.ajax({
      success: function(html) {
        //alert(html);
        //$("#my-all-examinations").html(html);
      },
      url: "/admin/examinations/",
      dataType: 'script',
      data: {courses: selectedItem}
    })
  });
})

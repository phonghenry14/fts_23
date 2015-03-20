//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
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

function check_only_one_checkbox() {
  $('input[type="checkbox"]').bind('click',function() {
    $('input[type="checkbox"]').not(this).prop("checked", false);
  });
}
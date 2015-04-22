$ ->
  $('#courses').click ->
    item = $('#courses')
    selectedItem = $('#courses').val()
    $.ajax
      success: (html) ->
      url: '/admin/examinations/'
      dataType: 'script'
      data: courses: selectedItem
    return
  return

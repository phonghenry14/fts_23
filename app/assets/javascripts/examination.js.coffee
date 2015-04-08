$(document).ready ->
  data_id_exam = $('#getting-started').data('id-exam')
  timer = localStorage.getItem('id_' + data_id_exam) or 0
  if timer == 0
    $('#getting-started').html('Full Time').parent().parent().next().next().find('.btn-primary').remove()
  else
    $('#getting-started').countdown(timer, (event) ->
      $(this).text event.strftime('%H:%M:%S')
      return
    ).on 'finish.countdown', (event) ->
      $(this).html('Full Time').parent().parent().next().next().find('.btn-primary').remove()
      localStorage.clear()
      return
  return
$ ->
  $('.start').click ->
    timer2 = $('#getting').data('time')
    data_id_exam = $('#getting').data('id-exam')
    localStorage.setItem 'id_' + data_id_exam, timer2
    $.ajax
      url: '/examinations/' + data_id_exam
      type: 'PUT'
    return
  $('#start-new').click ->
    localStorage.clear()
    return
  return

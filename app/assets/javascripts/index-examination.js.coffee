$(window).ready ->
  status = $('#getting').data('exam-status')
  if status == 'Ready'
    $('#start-new').remove()
  return

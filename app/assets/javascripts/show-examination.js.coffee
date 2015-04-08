$(document).ready ->
  data_id_exam = $('#getting-started').data('id-exam')
  timer2 = $('#getting-started').data('time')
  timer = localStorage.getItem('id_' + data_id_exam) or 0
  if (timer != 0) and (timer > timer2)
    $(window).load (event) ->
      a = confirm('You want to submit?')
      if `a == true`
        $('#exam-btn-submit').click()
      else
        return false
      return
    window.location.hash = 'no-back-button'
    window.location.hash = 'Again-No-back-button'

    window.onhashchange = ->
      window.location.hash = 'no-back-button'
      return

    $(window).ready ->
      $('header').bind 'click', (event) ->
        c = confirm('You want to submit?')
        if `c == true`
          $('#exam-btn-submit').click()
        else
          return false
        return
      $('footer').bind 'click', (event) ->
        b = confirm('You want to submit?')
        if `b == true`
          $('#exam-btn-submit').click()
        else
          return false
        return
      return

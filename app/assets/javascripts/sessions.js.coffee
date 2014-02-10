# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.table > tbody > tr').click ->
    user_id = $(this).attr('user_id')
    $('#session_form_user_id').val(user_id)
    $('#session_form').submit()
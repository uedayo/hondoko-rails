# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.table.books > tbody > tr').click ->
    isbn = $(this).attr('book_isbn')
    location.href = '/books/' + isbn + '/'
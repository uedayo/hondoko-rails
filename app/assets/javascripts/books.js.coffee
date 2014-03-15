# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.table.books > tbody > tr').addClass('pointer').click ->
    isbn = $(this).attr('book_isbn')
    qid = $(this).attr('qid')
    url = '/books/' + isbn
    if qid
      url += '/?qid=' + qid
    location.href = url
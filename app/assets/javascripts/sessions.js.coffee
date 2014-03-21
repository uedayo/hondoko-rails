# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # initialize dataTable
  $('#login_users').dataTable
    "oLanguage":
      "sProcessing": "読み込み中..."
      "sLengthMenu": ''
      "sInfo": "_TOTAL_ 件中 _START_ 件から _END_ 件を表示中"
      "sInfoEmpty": "_TOTAL_ 件"
      "sInfoFiltered": " (全 _MAX_ 件からフィルタ)"
      "sInfoPostFix": ""
      "sZeroRecords"   : "該当するユーザが見つかりませんでした"
      "sSearch": ""
      "sUrl": ""
      "bProcessing" : true
      "oPaginate":
        "sNext": "次のページ"
        "sPrevious": "前のページ"
    "iDisplayLength": "-1"
    "sPaginationType": "bootstrap"
  $('#login_users_length').parent('div').remove()
  $('#login_users_filter').parent('div').addClass('search-bar')
  $('#login_users_filter').parent('div').attr('data-0', "background-color:rgb(255,255,255);border-color:rgb(255,255,255);position:relative;").attr('data-350', "background-color:rgb(248,248,248);border-color:rgb(231,231,231);position:fixed;top:0%;")
  $('#login_users_filter').parent('div').removeClass('col-xs-6').addClass('col-xs-12')
  $('#login_users_filter').prepend('<i class="glyphicon glyphicon-search hidden-xs hidden-sm">')
  $('#login_users_filter > label').addClass('datatable-label')
  $('#login_users_filter > label > input').addClass('form-control input-lg').attr('placeholder', 'なまえの一部を入力').focus()
  $('.pagination').remove()
  $('.table.users > tbody > tr').addClass('pointer').click ->
    id = $(this).attr('user_id')
    $('#session_form_id').val(id)
    $('#session_form').submit()

  $('#login_users_filter > label > input').bind "keyup", (e) ->
    $("html,body").animate
      scrollTop: 0
    , "fast"

  width = (if window.innerWidth then window.innerWidth else $(window).width())
  # initialize skrollr
  skrollr.init() if width > 992

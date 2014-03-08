# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#login_users').dataTable
    "oLanguage":
      "sProcessing": "読み込み中..."
      "sLengthMenu": '表示する行数: <select>'+
      '<option value="25">25</option>'+
      '<option value="50">50</option>'+
      '<option value="100">100</option>'+
      '<option value="-1">全件</option>'+
      '</select>'
      "sInfo": "_TOTAL_ 件中 _START_ 件から _END_ 件を表示中"
      "sInfoEmpty": "_TOTAL_ 件"
      "sInfoFiltered": " (全 _MAX_ 件からフィルタ)"
      "sInfoPostFix": ""
      "sZeroRecords"   : "該当するユーザが見つかりませんでした"
      "sSearch": "パッとしぼりこみ"
      "sUrl": ""
      "bProcessing" : true
      "oPaginate":
        "sNext": "次のページ"
        "sPrevious": "前のページ"
    "iDisplayLength": "-1"
    "sPaginationType": "bootstrap"
  $('.dataTables_length > label').addClass('datatable-label')
  $('.dataTables_length > label > select').addClass('form-control')
  $('#login_users_filter > label').addClass('datatable-label')
  $('#login_users_filter > label > input').addClass('form-control')
  $('.table.users > tbody > tr').click ->
    id = $(this).attr('user_id')
    $('#session_form_id').val(id)
    $('#session_form').submit()
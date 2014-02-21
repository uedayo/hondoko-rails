# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#get_twitter_image').click ->
    screen_name = $('#screen_name').val()
    post_data = "screen_name=" + screen_name
    $.ajax
      async:     true
      type:      "POST"
      url:       "/users/twitter_image/"
      dataType:  "text"
      context:    this
      data:      post_data
      success:   (data, status, xhr)   -> $('#image_url').val data
      error:     (xhr,  status, error) -> alert "データを取得できませんでした。"
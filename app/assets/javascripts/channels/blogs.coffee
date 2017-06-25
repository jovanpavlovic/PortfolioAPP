jQuery(document).on 'turbolinks:load', -> /*povezije sa turbolinks-ucitavanje fajlova*/
  comments = $('#comments')
  if comments.length > 0/*ako ima komentara pokreni action cable*/
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')/*show.html.id*/
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).length > 1 /*data validation, spaces*/
      App.global_chat.send_comment textarea.val(),
      comments.data('blog-id')
      textarea.val('')
    e.preventDefault()
    return false
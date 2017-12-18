App.forum = App.cable.subscriptions.create channel: "ForumChannel",
  connected: (data)->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    channel_id = parseInt(window.location.href.split('forums/')[1])
    if channel_id is data.channel_id
      $(".messages").append data['message']

  speak: (msg)->
    @perform 'speak', message: msg.value, channel: msg.formAction

$(document).on 'keypress', '[data-behavior~=forum_speaker]', (event)->
  if event.keyCode is 13
    App.forum.speak event.target
    event.target.value = ''
    event.preventDefault()
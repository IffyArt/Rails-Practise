class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'forum_channel', message: render_message(message), channel_id: message.forum_id
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
end

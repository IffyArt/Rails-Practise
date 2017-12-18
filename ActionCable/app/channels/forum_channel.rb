class ForumChannel < ApplicationCable::Channel
  def subscribed
    stream_from "forum_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    forum_id = data['channel'].split('forums/')[1]
    Message.create content: data['message'], forum_id: forum_id
  end
end

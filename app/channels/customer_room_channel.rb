class CustomerRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "customer_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast "customer_room_channel", message: data, sent_by: 'sent by the user abcd efgh'
  end

end

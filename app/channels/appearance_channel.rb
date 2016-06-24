# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    current_user.online
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.offline
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def name
  	email.split('@')[0]
  end

  def online
    REDIS.sadd("online", self.name)
    AppearanceBroadcastJob.perform_later list
  end

  def offline
    REDIS.srem("online", self.name)
    AppearanceBroadcastJob.perform_later list
  end

  def list
    REDIS.smembers("online")
  end
end

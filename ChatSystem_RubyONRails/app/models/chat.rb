class Chat < ApplicationRecord
  belongs_to :application

  before_create :set_chat_number
  before_create :set_messages_count

  def set_chat_number
    self.number = (self.application.chats_count || 0) + 1
    self.application.chats_count = self.application.chats_count + 1
    self.application.save
  end

  private
    def set_messages_count
      self.messages_count = 0
    end
end

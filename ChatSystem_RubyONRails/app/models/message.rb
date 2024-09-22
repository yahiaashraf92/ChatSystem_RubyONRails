class Message < ApplicationRecord
  searchkick

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat

  before_create :set_message_number

  def set_message_number
    self.number = (self.chat.messages_count || 0) + 1
    self.chat.messages_count = self.chat.messages_count + 1
    self.chat.save
  end
end

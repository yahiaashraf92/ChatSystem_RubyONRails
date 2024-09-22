class Application < ApplicationRecord
    before_create :generate_token
    before_create :set_chat_count

    private
    def generate_token
        self.token = SecureRandom.hex(10)
    end

    private
    def set_chat_count
      self.chats_count = 0
    end
end

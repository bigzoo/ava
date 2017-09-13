class Reminder < ApplicationRecord
   validates :time, :session_token, presence: true
end

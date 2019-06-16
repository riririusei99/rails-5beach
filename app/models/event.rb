class Event < ApplicationRecord
  
  # association
  belongs_to :user
  
  def your_event?(user)
    self.user_id == user.id
  end
end

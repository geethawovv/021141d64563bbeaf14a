class User < ApplicationRecord
  validates :firstName,:lastName,:email,presence:true

  def self.search(search_term)
    where('firstName LIKE :search OR lastName LIKE :search OR email LIKE :search',
      search:"%#{search_term}%")
  end

end

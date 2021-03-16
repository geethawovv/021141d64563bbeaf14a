class User < ApplicationRecord
  validates :firstName,:lastName,:email,presence:true
end

class User < ApplicationRecord
    has_many :books, dependent: :destroy
    has_many :comments, dependent: :destroy
  
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
  

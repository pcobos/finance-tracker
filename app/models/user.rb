class User < ApplicationRecord
has_many: :stocks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

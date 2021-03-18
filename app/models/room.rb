class Room < ApplicationRecord
	has_many :assignments, dependent: :destroy
  	has_many :guests, through: :assignments
end

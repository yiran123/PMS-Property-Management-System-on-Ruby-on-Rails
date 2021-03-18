class Guest < ApplicationRecord
	has_many :assignments, dependent: :destroy
  	has_many :rooms, through: :assignments
end

class Category < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
  has_many :tasks
end

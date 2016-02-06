class Electronic < ActiveRecord::Base
  validates :name, presence: true
end

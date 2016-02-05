class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :weight, numericality: true, allow_blank: true
  validates :height, numericality: true, allow_blank: true
end

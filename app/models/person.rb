class Person < ActiveRecord::Base
  validates :name, presence = true
  validates :weight, presence = true, numericality: true
  validates :height, presence = true, numericality: true
  validates :colour, presence = true
end

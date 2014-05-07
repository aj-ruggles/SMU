class Group < ActiveRecord::Base
  has_many :users
  has_many :schedules, :through => :users
  has_one :user
  belongs_to :organization
  accepts_nested_attributes_for :schedules
end

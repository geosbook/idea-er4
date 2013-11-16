# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  lat        :float
#  lng        :float
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
  
  has_many :roles, as: :enrollable
  has_one :user, through: :role
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  
end

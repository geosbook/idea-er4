# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  lat        :float
#  lng        :float
#  speed      :float
#  course     :float
#  height     :float
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Unit < ActiveRecord::Base
  has_many :roles, as: :enrollable
  has_one :user, through: :role
  validates :name, presence: true

end

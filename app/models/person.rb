# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  lat        :float
#  lng        :float
#  speed      :float
#  course     :float
#  height     :float
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
  
  has_many :roles, as :enrollable
  has_one :user, through: :role
  validates :firstname, presence: true
  validates :lastname, presence: true

  
end

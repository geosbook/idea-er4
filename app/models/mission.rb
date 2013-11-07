# == Schema Information
#
# Table name: missions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Mission < ActiveRecord::Base
  has_many :contexts, dependent: :destroy
  validates :name, presence: true
  
end

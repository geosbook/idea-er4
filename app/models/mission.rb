# == Schema Information
#
# Table name: missions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  parent_id   :integer
#

class Mission < ActiveRecord::Base
  
  acts_as_tree dependent: :delete_all
  has_many :contexts, dependent: :destroy
  validates :name, presence: true
  
end

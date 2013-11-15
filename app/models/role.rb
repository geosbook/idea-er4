# == Schema Information
#
# Table name: roles
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  parent_id       :integer
#  enrollable_id   :integer
#  enrollable_type :string(255)
#  mission_id      :integer
#  manager_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Role < ActiveRecord::Base

  acts_as_tree dependent: :delete_all
  has_one :user, dependent: :destroy
  belongs_to :mission
  belongs_to :enrollable, polymorphic: true 
  belongs_to :manager, class_name: "Role"
  validates :name, presence: true
  
  
end

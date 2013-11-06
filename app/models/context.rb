# == Schema Information
#
# Table name: contexts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  mission_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Context < ActiveRecord::Base
  belongs_to :mission
  has_many :geosmaps, dependent: :destroy
end

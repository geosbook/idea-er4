# == Schema Information
#
# Table name: geosmaps
#
#  id         :integer          not null, primary key
#  centerlat  :float
#  centerlng  :float
#  name       :string(255)
#  zoom       :integer
#  maptype    :string(255)
#  context_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Geosmap < ActiveRecord::Base
  belongs_to :context
end

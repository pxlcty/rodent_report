class Report < ActiveRecord::Base
	#associations
  belongs_to :building

	#validations
	validates :animal, :number, :datetime, :building_id, presence: true
	validates :number, numericality: true

end

module Api
	module V1
		class BuildingsController < ApplicationController

			def index
				@buildings = Building.all
			end

		end
	end
end

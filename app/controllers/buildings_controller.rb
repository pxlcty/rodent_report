class BuildingsController < ApplicationController

	before_action :authorize, except: :index

	def index
		@buildings = Building.all
		@report = Report.new if current_user

		respond_to do |format|
			format.html #index.html.erb
			#format.json #{ render :json => @buildings }
		end
	end
  def new
	  @building = Building.new
  end

  def create
	  @building = Building.new(building_params)

	  if @building.save
		  redirect_to buildings_path, notice: "Building saved!"
	 else
		render 'new', alert: "There was an error"
	end
  end

  def show
	  @building = Building.find(params[:id])
  end

  def edit
	  @building = Building.find(params[:id])
  end

  def update
	@building = Building.find(params[:id])
	if @building.update(building_params)
		redirect_to buildings_path, notice: "Building updated!"
	else
		render 'edit', alert: "There was an error"
	end
  end

  def destroy
	@building = Building.find(params[:id])
	@building.destroy
	redirect_to buildings_path, notice: "Building deleted"
  end



  private
  def building_params
	  params.require(:building).permit(:houseno, :streetname, :borough, :city, :state, :neighborhood, :block, :lot, :bin)
  end
end

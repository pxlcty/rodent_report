class ReportsController < ApplicationController

  def new
  	@report = Report.new
  end

  def index
    @buildings = Building.all
  end

  def create
  	@report = Report.new(report_params)

  	if @report.save
  		redirect_to root_path
  	else
  		redirect_to root_path, notice: "There was an error!"
  	end
  end

  def show
  end

  def edit
  end

  def destroy
  end

private

	def report_params
		params.require(:report).permit(:animal, :number, :datetime, :building_id)
	end
end

json.rodentreports @buildings.each do |building|
	json.building building.full_address
	json.reports building.reports.each do |report|
		json.report_id report.id
		json.report_date report.datetime
		json.report_animal report.animal
		json.report_number report.number
	end
end

#review and check format @http://jsonline.com/

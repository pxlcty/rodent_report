class Building < ActiveRecord::Base

	#associations
	has_many :reports

	#validations
	validates :houseno, :streetname, :borough, presence: true

	#callback
	#get building information form the NYC GeoClient API
	after_create :get_building_info

	# methods
	def full_address
		"#{self.houseno}" + " " + "#{self.streetname}"
	end

	def get_building_info

	#require the Ruby classes that let us access URLs from our app
	require 'net/http'
	require 'uri'

	#encode the data we'll feed into the NYC GeoClient API
	houseno		= URI.encode(self.houseno)
    streetname	= URI.encode(self.streetname)
    borough		= URI.encode(self.borough)

    #FILL IN THESE STRINGS WITH YOUR UNIQUE APP_ID & APP_KEY
    app_id = "e32d4e17"
    app_key = "58ad1f19f56264308a28c63b4ec8fa4e"

    #building the URL to request an address from the NYC GeoClient API
    request_url = "https://api.cityofnewyork.us/geoclient/v1/address.json?houseNumber=" + "#{houseno}" + "&street=" + "#{streetname}" + "&borough=" + "#{borough}" + "&app_id=" + "#{app_id}" + "&app_key=" + "#{app_key}"
	#puts "///////////"
	#puts request_url

    #sending a request for the URL
    request = eval(Net::HTTP.get(URI.parse(request_url)))

    #save the info the API returned to our database
    self.bin            = request[:address][:buildingIdentificationNumber]
    self.block          = request[:address][:bblTaxBlock]
    self.lot            = request[:address][:bblTaxLot]
    self.streetname     = request[:address][:boePreferredStreetName]
    self.city           = request[:address][:uspsPreferredCityName]
    self.state          = "NY"
    self.neighborhood   = request[:address][:ntaName]

    self.save!

end
end

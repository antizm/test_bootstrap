
class MainController < ApplicationController
  def index
#	require 'rubygems'
#	require 'yahoo-weather'

#  	@client = YahooWeather::Client.new
	# look up WOEID via http://weather.yahoo.com; enter location by city
	# name or zip and WOEID is at end of resulting page url.  herein we use
	# the WOEID for Santa Monica, CA.
#	response = @client.lookup_by_woeid(2488892)

	# straight text output
	#print <<edoc
	#{response.title}
	#{response.condition.temp} degrees
	#{response.condition.text}
	#edoc
	
  end
end

class PagesController < ApplicationController
  def index
    @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chicago%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body

    @day = @weather['query']['results']['channel']['item']['forecast']
    @location = @weather['query']['results']['channel']['location']
  end

  def search
    city = params[:city]
    state = params[:state]

    if city.blank? == false || state.blank? == false
      @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
  
      @day = @weather['query']['results']['channel']['item']['forecast']
      @location = @weather['query']['results']['channel']['location']

    else
      redirect_to '/'
    end

  end
end

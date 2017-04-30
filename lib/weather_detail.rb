require 'uri'
require 'net/http'
require 'json'

module WeatherDetail
  ENDPOINT = 'http://api.openweathermap.org/data/2.5/weather'

  def get_weather_details loc_params = {}
    uri = set_params( loc_params )
    json = get_response( uri )

    data = {}

    return {} unless json

    data[:city] = json['name']
    data[:country] = json['sys'] && json['sys']['country']
    data[:longitude] = json['coord'] && json['coord']['lon']
    data[:latitude] = json['coord'] && json['coord']['lat']
    data[:temperature] = json['main']['temp']
    data[:pressure] = json['main']['pressure']
    data[:humidity] = json['main']['humidity']
    data[:min_temperature] = json['main']['temp_min']
    data[:max_temperature] = json['main']['temp_max']
    data[:clouds] = json['clouds']['all']
    data[:wind_speed] = json['wind']['speed']
    data[:wind_angle] = json['wind']['deg']

    return data
  end

  private

  def get_response(uri)
    req = Net::HTTP::Get.new(uri.request_uri)
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req)
    }
    json = JSON.parse(res.body)
    if json['cod'] == 200
      return json
    else
      return nil
    end
  end

  def set_params(options)
    options[:units] ||= "metric" 

    uri = URI(ENDPOINT)
    query_params = {appid: Rails.application.secrets.openweather_api_key}
    uri.query = URI.encode_www_form(query_params.merge(lat: options[:lat], lon: options[:lon], units: options[:units])) if options[:lat] && options[:lon]
    options[:city] = options[:city] + "," + options[:country_code] if options[:country_code]
    uri.query = URI.encode_www_form(query_params.merge(q: options[:city], units: options[:units])) if options[:city]
    return uri
  end
end
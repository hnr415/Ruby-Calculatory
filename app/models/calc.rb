# require 'httparty'
require 'net/http'
require 'json'
# response = HTTParty.get('https://newton.now.sh/operation/expression')

# puts "The result for #{response["expression"]} is #{response["result"]}"
# shotgun -p $PORT -o $IP


def get_expression(operation, expression)
   expression.gsub!("^","%5E")
   expression.gsub!(" ","")
   uri = URI("https://newton.now.sh/#{operation}/#{expression}")
   puts uri
   response = Net::HTTP.get(uri)
   response_format = JSON.parse(response)
   return response_format
end
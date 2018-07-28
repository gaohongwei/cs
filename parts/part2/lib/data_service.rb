require 'faraday'
require 'json'

class DataService
  def initialize(url)
    @url = url
  end
  def retrieve_data
    response = Faraday.get @url
    status = response.status
    if status == 200
      data = JSON.parse(response.body)
      {status: status, data: data}
    else 
      {status: status, errors: 'Failed to retrieve data'}
    end
  end
end
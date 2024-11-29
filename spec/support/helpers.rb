def parsed_response
  @parsed_response ||= JSON.parse(response.body, symbolize_names: true)
end

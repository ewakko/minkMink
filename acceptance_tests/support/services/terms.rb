#Function that returns all termss
def get_all_terms()

  request = API_URL + "terms"
  @response = RestClient.get request
  @parsed_response = JSON.parse(@response)

  return
end

#Function that returns term, given the id
def get_term(t_id)

  request = API_URL + "terms/#{t_id}"
  @response = RestClient.get request
  @parsed_response = JSON.parse(@response)

  parse_term(@parsed_response)
  return
end

#Function that makes a term
def create_term(term_info)
  #term_info = DEFAULT_terms.merge(term_info)
  term_info = {"term" => term_info}
  request = API_URL + "terms"

  @response = RestClient.post request, term_info
  @parsed_response = JSON.parse(@response)
  save_term_id(@parsed_response["id"])
  parse_term(@parsed_response)
  log_mutant("created")
  return
end

#Function that updates a term, given the id
def update_term(t_id, term_info)
  term_info = {"term" => term_info}
  request = API_URL + "terms/#{t_id}"
  @response = RestClient.patch request, term_info#
  @parsed_response = JSON.parse(@response)
  log_mutant("updated")
  return
end

#Function that deletes a term, given the id
def delete_term(t_id)

  request = API_URL + "terms/#{t_id}"
  @response = RestClient.delete request
  log_mutant("deleted")
  return
end

def parse_term(term_info)

  id = term_info["id"]
  begins_at = term_info["begins_at"]
  ends_at = term_info["ends_at"]
  created_at = term_info["created_at"]
  updated_at = term_info["updated_at"]

end

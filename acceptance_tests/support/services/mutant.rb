#Function that returns all mutants
def get_all_mutants()

  request = API_URL + "mutants"
  @response = RestClient.get request
  #@parsed_response = JSON.parse(@response)
  #puts @parsed_response
  parse_mutant(@response)
  #puts @response
  return
end

#Function that returns mutant, given the id
def get_mutant(m_id)

  get_request = API_URL + "mutants/#{m_id}"
  @response = RestClient.get(get_request){|response, request, result| response }

  @parsed_response = JSON.parse(@response)
  @parsed_response["status"] ? @parsed_response.merge("code" => @parsed_response["status"]) : parse_mutant(@parsed_response)
  return
end

#Function that makes a mutant
def create_mutant(mutant_info)
  #mutant_info = DEFAULT_MUTANT.merge(mutant_info)
  mutant_info = {"mutant" => mutant_info}
  request = API_URL + "mutants"

  @response = RestClient.post(request, mutant_info){|response, request, result| response }
  @parsed_response = JSON.parse(@response)
  if @parsed_response["status"]
    @parsed_response.merge("code" => @parsed_response["status"])
    return
  else
    save_mutant_id(@parsed_response["id"])
    parse_mutant(@parsed_response)
    log_mutant("created")
  end
  return
end

#Function that updates a mutant, given the id
def update_mutant(m_id, mutant_info)
  mutant_info = {"mutant" => mutant_info}
  request = API_URL + "mutants/#{m_id}"
  @response = RestClient.patch(request, mutant_info){|response, request, result| response }
  @parsed_response = JSON.parse(@response)
  if @parsed_response["status"]
    @parsed_response.merge("code" => @parsed_response["status"])
    return
  else
    parse_mutant(@parsed_response)
    log_mutant("updated")
  end
  return
end

#Function that deletes a mutant, given the id
def delete_mutant(m_id)

  request = API_URL + "mutants/#{m_id}"
  @response = RestClient.delete request
  log_mutant("deleted")
  return
end

def parse_mutant(mutant_info)

  id = mutant_info["id"]
  mutant_name = mutant_info["mutant_name"]
  power = mutant_info["power"]
  real_name = mutant_info["real_name"]
  eligibility_begins_at = mutant_info["eligibility_begins_at"]
  eligibility_end_at = mutant_info["eligibility_ends_at"]
  may_advise_beginning_at = mutant_info["may_advise_beginning_at"]
  url = mutant_info["url"]

end

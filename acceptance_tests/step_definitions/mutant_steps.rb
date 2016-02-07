When /^I retrieve all mutants$/ do
  get_all_mutants()
end

When /^I retrieve the mutant with the id "(.*)"$/ do |m_id|
  get_mutant(m_id)
end

When /^I retrieve my mutant$/ do
  get_mutant(get_mutant_id)
end

When /^I create a mutant with$/ do |table|
  mutant_info = table.hashes.first
  create_mutant(mutant_info)
end

When /^I create a mutant with mutant name "(.*)", real name "(.*)", and power "(.*)"$/ do |m_name, r_name, power|
  mutant_info = {"mutant_name" => m_name, "real_name" => r_name, "power" => power}
  create_mutant(mutant_info)
end

When /^I update a mutant with the id "(.*)" with$/ do |table|
  mutant_info = table.hashes.first
  update_mutant(m_id, mutant_info)
end

When /^I update a mutant with the id "(.*)" to mutant name "(.*)", real name "(.*)", and power "(.*)"$/ do |m_id, m_name, r_name, power|
  mutant_info = {"mutant_name" => m_name, "real_name" => r_name, "power" => power}
  update_mutant(m_id, mutant_info)
end

When /^I update my mutant to mutant name "(.*)", real name "(.*)", and power "(.*)"$/ do |m_name, r_name, power|
  mutant_info = {"mutant_name" => m_name, "real_name" => r_name, "power" => power}
  update_mutant(get_mutant_id, mutant_info)
end

When /^I delete the mutant with the id "(.*)"$/ do |m_id|
  delete_mutant(m_id)
end

When /^I delete my mutant$/ do
  delete_mutant(get_mutant_id)
end

Then /^the response code is "(.*)"$/ do |code|
  puts @response
  @response.code.should == code.to_i
end

Then /^the error message is "(.*)"$/ do |err_msg|
  puts @response
  @response.error.should == err_msg
end

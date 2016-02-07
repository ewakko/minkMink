When /^I retrieve all terms$/ do
  get_all_terms()
end

When /^I retrieve the term with the id "(.*)"$/ do |m_id|
  get_term(m_id)
end

When /^I retrieve my term$/ do
  get_term(get_term_id)
end

When /^I create a term with$/ do |table|
  term_info = table.hashes.first
  create_term(term_info)
end

When /^I create a term with term beginning at "(.*)" and ends at "(.*)"$/ do |begin_dt, end_dt|
  term_info = {"begins_at" => begin_dt, "ends_at" => end_dt}
  create_term(term_info)
end

When /^I update a term with the id "(.*)" with$/ do |table|
  term_info = table.hashes.first
  update_term(m_id, term_info)
end

When /^I update a term to begin at "(.*)" and end at "(.*)"$/ do |begin_dt, end_dt|
  term_info = {"begins_at" => begin_dt, "ends_at" => end_dt}
  update_term(m_id, term_info)
end

When /^I update my term to begin at "(.*)" and end at "(.*)"$/ do |begin_dt, end_dt|
  term_info = {"begins_at" => begin_dt, "ends_at" => end_dt}
  update_term(get_term_id, term_info)
end

When /^I delete the term with the id "(.*)"$/ do |m_id|
  delete_term(m_id)
end

When /^I delete my term$/ do
  delete_term(get_term_id)
end

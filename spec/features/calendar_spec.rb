require "rails_helper"

describe "/calendar_invite/new" do
  it "has a label with the text 'Name' that has a matching input", points: 1 do
    visit "/calendar_invite/new"
    name_label = find("label", :text => /Name/i)
    for_attribute = name_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found #{all_input_ids.count(for_attribute)}."  
    end
  end
end

describe "/calendar_invite/new" do
  it "has a label with the text 'Details' that has a matching input", points: 1 do
    visit "/calendar_invite/new"
    details_label = find("label", :text => /Details/i)
    for_attribute = details_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found #{all_input_ids.count(for_attribute)}."  
    end
  end
end

describe "/calendar_invite/new" do
  it "has a label with the text 'Location' that has a matching input", points: 1 do
    visit "/calendar_invite/new"

    location_label = find("label", :text => /Location/i)
    for_attribute = location_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found #{all_input_ids.count(for_attribute)}."  
    end
  end
end

describe "/calendar_invite/new" do
  it "has a label with the text 'Start time' that has a matching input", points: 1 do
    visit "/calendar_invite/new"

    start_time_label = find("label", :text => /Start time/i)
    for_attribute = start_time_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found #{all_input_ids.count(for_attribute)}."  
    end
  end
end

describe "/calendar_invite/new" do
  it "has a label with the text 'End time' that has a matching input", points: 1 do
    visit "/calendar_invite/new"
    end_time_label = find("label", :text => /End time/i)
    for_attribute = end_time_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found #{all_input_ids.count(for_attribute)}."  
    end
  end
end

describe "/calendar_invite/new" do
  it "has a form that submits to '/calendar_invite/results'", points: 1 do
    visit "/calendar_invite/new"
    calendar_form = find("form")
    action_attribute = calendar_form[:action]

    expect(action_attribute).to eq("/calendar_invite/resutls")

  end
end

describe "/calendar_invite/results" do
  it "displays the invitation link in a textarea tag", points: 1 do
    visit "/calendar_invite/new"

    fill_in "Name", with: "EVENT NAME"
    fill_in "Details", with: "DETAILS"
    fill_in "Location", with: "INSIDE"
    fill_in "Start time", with: "2020-07-01T00:00"
    fill_in "End time", with: "2020-07-31T00:00"

    click_button "Generate"

    expect(page).to have_text("https://www.google.com/calendar/render?action=TEMPLATE&text=EVENT NAME&details=DETAILS&location=INSIDE&dates=20200701T000000Z/20200731T000000Z")
  end
end

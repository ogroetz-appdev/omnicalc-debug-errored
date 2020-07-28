class CalendarController < ApplicationController
  
  def invite
    
    render({ :template => "calendar_templates/new.html.erb"})
  end

  def generate
    @name = params.fetch("event_name")
    @details = params.fetch("event_details")
    @location = params.fetch("event_location")

    regular_start_date = params.fetch("start_time")
    @start_date = regular_start_date.to_s.gsub("-", "").gsub(":", "") + "00Z"

    regular_end_date = params.fetch("end_time")
    @end_date = regular_end_date.to_s.gsub("-", "").gsub(":", "") + "00Z"
    
    @invite = "https://www.google.com/calendar/render?action=TEMPLATE&text=#{@name}&details=#{@details}&location=#{@location}&dates=#{@start_date}/#{@end_date}"

    render({ :template => "calendar_templates/results.html.erb"})
  end
end

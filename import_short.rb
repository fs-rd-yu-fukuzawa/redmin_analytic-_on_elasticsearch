#!/usr/bin/env ruby
 
require "csv"
 
CSV.open("data/short_issues.csv", "r") do |f|
  f.each_with_index do |item, i|
    # next if i i == 0
    `curl -XPOST 'http://localhost:9200/redmine_short_issues/#{item[0]}?pretty' -H "Content-type: application/json" -d '
      {
        "id": #{item[0]},
        "project": "#{item[1]}",
        "tracker": "#{item[2]}",
        "status": "#{item[3]}",
        "priority": "#{item[4]}",
        "title": "#{item[5]}",
        "voter": "#{item[6]}",
        "personnel": "#{item[7]}",
        "SS/RDpersonnel": "#{item[8]}",
        "voter_request_date": "#{item[9]}",
        "start_date": "#{item[10]}",
        "deadline": "#{item[11]}",
        "actual_start_date": "#{item[12]}",
        "actual_end_date": "#{item[13]}"
      }
    '`
  end
end

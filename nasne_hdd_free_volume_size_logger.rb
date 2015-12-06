#!/usr/bin/env ruby
require "pp"
require "json"
require "date"

date = Time.now.strftime("%Y-%m-%d %H:%M:%S %z")
index = "nasne_hdd_free_volume_size"
type = "log"

result = JSON.parse(`curl -s "http://192.168.11.2:64210/status/HDDInfoGet?id=0" | jq ".HDD"`)
result["date"] = date
result["freeVolumeSizeRatio"] = result["freeVolumeSize"].to_f / result["totalVolumeSize"].to_f

puts "{ \"index\" : { \"_index\" : \"#{index}\", \"_type\" : \"#{type}\", \"_id\" : \"#{date}\"} }"
puts result.to_json

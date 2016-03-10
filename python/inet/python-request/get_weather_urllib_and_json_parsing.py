import urllib2
import json
f = urllib2.urlopen('http://api.wunderground.com/api/5a6733ff3da11976/geolookup/conditions/q/IA/Cedar_Rapids.json')
print f
print "json"
json_string = f.read()
print json_string
parsed_json = json.loads(json_string)
print "parsed_json"
print parsed_json
location = parsed_json['location']['city']
temp_f = parsed_json['current_observation']['temp_f']
print "Current temperature in %s is: %s" % (location, temp_f)
f.close()


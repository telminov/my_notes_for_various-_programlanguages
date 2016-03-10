import requests

my_url ="http://api.wunderground.com/api/5a6733ff3da11976/geolookup/conditions/q/IA/Cedar_Rapids.json"
key = "5a6733ff3da11976"

ApiUrl = "http://api.wunderground.com/api/{0}/forecast/conditions/q/NY/New_York.json".format(key)

r = requests.get(my_url)
print r
forecast = r.json
print forecast
print type(forecast)
print dir(forecast)
print list(forecast)
print forecast['response']



curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85" > lab5/aviation.json

echo "First six receipt times:"
jq -r '.[0:6] | .[].receiptTime' lab5/aviation.json

average_temp=$(jq '[.[] | .temp] | add / length' lab5/aviation.json)
echo "Average Temperature: $average_temp"

cloudy_count=$(jq '[.[] | select(.clouds[0].cover != "CLR")] | length' lab5/aviation.json)
total_count=$(jq length lab5/aviation.json)
if (( cloudy_count > total_count / 2 )); then
    echo "Mostly Cloudy: true"
else
    echo "Mostly Cloudy: false"
fi

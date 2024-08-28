import requests
import time

def test_api_data_driven(url_template, test_data):
    for data in test_data:
        country = data['Country']
        postal_code = data['Postal Code']
        expected_place_name = data['Place Name']
        
        # Construct the URL
        url = url_template.format(country=country, postal_code=postal_code)
        
        start_time = time.time()
        response = requests.get(url)
        response_time = time.time() - start_time
        
        # Check status code
        assert response.status_code == 200, f"[{country}, {postal_code}] - Expected status code 200 but got {response.status_code}"
        print(f"[{country}, {postal_code}] - Status Code Check Passed: {response.status_code}")
        
        # Check Content-Type
        assert 'application/json' in response.headers['Content-Type'], \
            f"[{country}, {postal_code}] - Expected 'application/json' in Content-Type but got {response.headers['Content-Type']}"
        print(f"[{country}, {postal_code}] - Content-Type Check Passed: {response.headers['Content-Type']}")
        
        # Check response time
        assert response_time < 1, f"[{country}, {postal_code}] - Response time is above 1s: {response_time:.3f}s"
        print(f"[{country}, {postal_code}] - Response Time Check Passed: {response_time:.2f}s")
        
        # Check response JSON for Place Name
        json_response = response.json()
        found_place_name = any(place['place name'] == expected_place_name for place in json_response['places'])
        assert found_place_name, f"[{country}, {postal_code}] - Expected place name '{expected_place_name}' not found in response."
        print(f"[{country}, {postal_code}] - Place Name Check Passed: {expected_place_name}")

# Define test data
test_data = [
    {'Country': 'us', 'Postal Code': '90210', 'Place Name': 'Beverly Hills'},
    {'Country': 'us', 'Postal Code': '12345', 'Place Name': 'Schenectady'},
    {'Country': 'ca', 'Postal Code': 'B2R', 'Place Name': 'Waverley'}
]

# Call the test function with the URL template and test data
test_api_data_driven("http://api.zippopotam.us/{country}/{postal_code}", test_data)
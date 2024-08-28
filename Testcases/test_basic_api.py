import requests
import time

def test_api(url, expected_country, expected_state, expected_post_code, expected_place_name):
    start_time = time.time()
    response = requests.get(url)
    response_time = time.time() - start_time
    
    # Check status code
    assert response.status_code == 200, f"Expected status code 200 but got {response.status_code}"
    print(f"Status Code Check Passed: {response.status_code}")
    
    # Check Content-Type
    assert 'application/json' in response.headers['Content-Type'], \
        f"Expected 'application/json' in Content-Type but got {response.headers['Content-Type']}"
    print(f"Content-Type Check Passed: {response.headers['Content-Type']}")
    
    # Check response time
    assert response_time < 1, f"Response time is above 1s: {response_time:.3f}s"
    print(f"Response Time Check Passed: {response_time:.2f}s")
    
    # Check response JSON
    json_response = response.json()
    assert json_response['country'] == expected_country, \
        f"Expected country '{expected_country}' but got '{json_response['country']}'"
    print(f"Country Check Passed: {json_response['country']}")
    
    # Verify state at the top level
    assert json_response['state'] == expected_state, \
        f"Expected state '{expected_state}' but got '{json_response['state']}'"
    print(f"State Check Passed: {json_response['state']}")
    
    # Verify the place name for the specific post code
    found_place = any(
        place['post code'] == expected_post_code and place['place name'] == expected_place_name
        for place in json_response['places']
    )
    assert found_place, f"Expected place name '{expected_place_name}' for Post Code '{expected_post_code}' not found in response."
    print(f"Place Name Check Passed: {expected_place_name}")

# Test the API
test_api("http://api.zippopotam.us/de/bw/stuttgart", "Germany", "Baden-Württemberg", "70597", "Stuttgart Degerloch")


# Data-Driven Test
# test_data = [
#     {"country": "United States", "postal_code": "90210", "place_name": "Beverly Hills"},
#     {"country": "United States", "postal_code": "12345", "place_name": "Schenectady"},
#     {"country": "United States", "postal_code": "B2R", "place_name": "Waverley"}
# ]
# for data in test_data:
#     url = f"http://api.zippopotam.us/{data['country']}/{data['postal_code']}"
#     test_api(url, data['country'], data['postal_code'], data['place_name'])

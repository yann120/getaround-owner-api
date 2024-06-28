# GetAroundOwner::CheckinsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**car_checked_in_rental_post**](CheckinsApi.md#car_checked_in_rental_post) | **POST** /carCheckedInRental | Rental started for one of your cars |


## car_checked_in_rental_post

> car_checked_in_rental_post(opts)

Rental started for one of your cars

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::CheckinsApi.new
opts = {
  getaround_rentals_car_checked_in:  # GetaroundRentalsCarCheckedIn | This event is triggered when a rental starts and the car has been unlocked
}

begin
  # Rental started for one of your cars
  api_instance.car_checked_in_rental_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CheckinsApi->car_checked_in_rental_post: #{e}"
end
```

#### Using the car_checked_in_rental_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> car_checked_in_rental_post_with_http_info(opts)

```ruby
begin
  # Rental started for one of your cars
  data, status_code, headers = api_instance.car_checked_in_rental_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CheckinsApi->car_checked_in_rental_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_rentals_car_checked_in** | [**GetaroundRentalsCarCheckedIn**](GetaroundRentalsCarCheckedIn.md) | This event is triggered when a rental starts and the car has been unlocked | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


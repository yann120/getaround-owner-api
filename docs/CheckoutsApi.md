# GetAroundOwner::CheckoutsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**car_checked_out_rental_post**](CheckoutsApi.md#car_checked_out_rental_post) | **POST** /carCheckedOutRental | Rental ended for one of your cars |


## car_checked_out_rental_post

> car_checked_out_rental_post(opts)

Rental ended for one of your cars

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::CheckoutsApi.new
opts = {
  getaround_rentals_car_checked_out:  # GetaroundRentalsCarCheckedOut | This event is triggered when a rental ends and the car has been locked
}

begin
  # Rental ended for one of your cars
  api_instance.car_checked_out_rental_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CheckoutsApi->car_checked_out_rental_post: #{e}"
end
```

#### Using the car_checked_out_rental_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> car_checked_out_rental_post_with_http_info(opts)

```ruby
begin
  # Rental ended for one of your cars
  data, status_code, headers = api_instance.car_checked_out_rental_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CheckoutsApi->car_checked_out_rental_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_rentals_car_checked_out** | [**GetaroundRentalsCarCheckedOut**](GetaroundRentalsCarCheckedOut.md) | This event is triggered when a rental ends and the car has been locked | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


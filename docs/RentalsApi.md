# GetAroundOwner::RentalsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**booked_rental_post**](RentalsApi.md#booked_rental_post) | **POST** /bookedRental | New rental booked for one of your cars |
| [**canceled_rental_post**](RentalsApi.md#canceled_rental_post) | **POST** /canceledRental | Canceled rental for one of your cars |
| [**car_switched_rental_post**](RentalsApi.md#car_switched_rental_post) | **POST** /carSwitchedRental | There was a switch car on one of your rental |
| [**times_changed_rental_post**](RentalsApi.md#times_changed_rental_post) | **POST** /timesChangedRental | Rental time change for one of your car |


## booked_rental_post

> booked_rental_post(opts)

New rental booked for one of your cars

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::RentalsApi.new
opts = {
  getaround_rentals_booked:  # GetaroundRentalsBooked | This event is triggered when a new rental booking has been created for one of your cars
}

begin
  # New rental booked for one of your cars
  api_instance.booked_rental_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->booked_rental_post: #{e}"
end
```

#### Using the booked_rental_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> booked_rental_post_with_http_info(opts)

```ruby
begin
  # New rental booked for one of your cars
  data, status_code, headers = api_instance.booked_rental_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->booked_rental_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_rentals_booked** | [**GetaroundRentalsBooked**](GetaroundRentalsBooked.md) | This event is triggered when a new rental booking has been created for one of your cars | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## canceled_rental_post

> canceled_rental_post(opts)

Canceled rental for one of your cars

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::RentalsApi.new
opts = {
  getaround_rentals_canceled:  # GetaroundRentalsCanceled | This event is triggered when a rental has been canceled for one of your cars
}

begin
  # Canceled rental for one of your cars
  api_instance.canceled_rental_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->canceled_rental_post: #{e}"
end
```

#### Using the canceled_rental_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> canceled_rental_post_with_http_info(opts)

```ruby
begin
  # Canceled rental for one of your cars
  data, status_code, headers = api_instance.canceled_rental_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->canceled_rental_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_rentals_canceled** | [**GetaroundRentalsCanceled**](GetaroundRentalsCanceled.md) | This event is triggered when a rental has been canceled for one of your cars | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## car_switched_rental_post

> car_switched_rental_post(opts)

There was a switch car on one of your rental

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::RentalsApi.new
opts = {
  getaround_rentals_car_switched:  # GetaroundRentalsCarSwitched | This event is triggered when an owner or customer service team member switches the car used to perform a given rental
}

begin
  # There was a switch car on one of your rental
  api_instance.car_switched_rental_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->car_switched_rental_post: #{e}"
end
```

#### Using the car_switched_rental_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> car_switched_rental_post_with_http_info(opts)

```ruby
begin
  # There was a switch car on one of your rental
  data, status_code, headers = api_instance.car_switched_rental_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->car_switched_rental_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_rentals_car_switched** | [**GetaroundRentalsCarSwitched**](GetaroundRentalsCarSwitched.md) | This event is triggered when an owner or customer service team member switches the car used to perform a given rental | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## times_changed_rental_post

> times_changed_rental_post(opts)

Rental time change for one of your car

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::RentalsApi.new
opts = {
  getaround_rentals_times_changed:  # GetaroundRentalsTimesChanged | This event is triggered when the start or end time of a rental has been changed for one of your cars
}

begin
  # Rental time change for one of your car
  api_instance.times_changed_rental_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->times_changed_rental_post: #{e}"
end
```

#### Using the times_changed_rental_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> times_changed_rental_post_with_http_info(opts)

```ruby
begin
  # Rental time change for one of your car
  data, status_code, headers = api_instance.times_changed_rental_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling RentalsApi->times_changed_rental_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_rentals_times_changed** | [**GetaroundRentalsTimesChanged**](GetaroundRentalsTimesChanged.md) | This event is triggered when the start or end time of a rental has been changed for one of your cars | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


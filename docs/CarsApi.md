# GetAroundOwner::CarsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_car_by_id**](CarsApi.md#get_car_by_id) | **GET** /cars/{id}.json | Find a car by ID |
| [**get_cars**](CarsApi.md#get_cars) | **GET** /cars.json | Find all cars |


## get_car_by_id

> <GetaroundCar> get_car_by_id(id)

Find a car by ID

Find a car by ID

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::CarsApi.new
id = '1' # String | ID of car to return

begin
  # Find a car by ID
  result = api_instance.get_car_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CarsApi->get_car_by_id: #{e}"
end
```

#### Using the get_car_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetaroundCar>, Integer, Hash)> get_car_by_id_with_http_info(id)

```ruby
begin
  # Find a car by ID
  data, status_code, headers = api_instance.get_car_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetaroundCar>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CarsApi->get_car_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of car to return |  |

### Return type

[**GetaroundCar**](GetaroundCar.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_cars

> <Array<GetaroundCarsIndexInner>> get_cars(opts)

Find all cars

Find all cars

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::CarsApi.new
opts = {
  page: 'page_example', # String | Page number
  per_page: 'per_page_example' # String | Page size
}

begin
  # Find all cars
  result = api_instance.get_cars(opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CarsApi->get_cars: #{e}"
end
```

#### Using the get_cars_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetaroundCarsIndexInner>>, Integer, Hash)> get_cars_with_http_info(opts)

```ruby
begin
  # Find all cars
  data, status_code, headers = api_instance.get_cars_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetaroundCarsIndexInner>>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling CarsApi->get_cars_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **String** | Page number | [optional] |
| **per_page** | **String** | Page size | [optional][default to &#39;30&#39;] |

### Return type

[**Array&lt;GetaroundCarsIndexInner&gt;**](GetaroundCarsIndexInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


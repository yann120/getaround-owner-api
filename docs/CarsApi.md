# GetAroundOwner::CarsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_car_by_id**](CarsApi.md#get_car_by_id) | **GET** /cars/{id}.json | Find a car by ID
[**get_cars**](CarsApi.md#get_cars) | **GET** /cars.json | Find all cars

# **get_car_by_id**
> Car get_car_by_id(id)

Find a car by ID

Find a car by ID

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CarsApi.new
id = GetAroundOwner::null.new #  | ID of car to return


begin
  #Find a car by ID
  result = api_instance.get_car_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CarsApi->get_car_by_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [****](.md)| ID of car to return | 

### Return type

[**Car**](Car.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_cars**
> CarsIndex get_cars(opts)

Find all cars

Find all cars

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CarsApi.new
opts = { 
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find all cars
  result = api_instance.get_cars(opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CarsApi->get_cars: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | [****](.md)| Page number | [optional] 
 **per_page** | [****](.md)| Page size | [optional] [default to 30]

### Return type

[**CarsIndex**](CarsIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json




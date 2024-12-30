# GetAroundOwner::RentalsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_rental_by_id**](RentalsApi.md#get_rental_by_id) | **GET** /rentals/{id}.json | Find a rental by ID
[**get_rentals**](RentalsApi.md#get_rentals) | **GET** /rentals.json | Find rentals booked between dates

# **get_rental_by_id**
> Rental get_rental_by_id(id)

Find a rental by ID

Find a rental by ID

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::RentalsApi.new
id = GetAroundOwner::null.new #  | ID of rental to return


begin
  #Find a rental by ID
  result = api_instance.get_rental_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling RentalsApi->get_rental_by_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [****](.md)| ID of rental to return | 

### Return type

[**Rental**](Rental.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_rentals**
> RentalsIndex get_rentals(start_date, end_date, opts)

Find rentals booked between dates

Find rentals booked between dates

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::RentalsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = { 
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find rentals booked between dates
  result = api_instance.get_rentals(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling RentalsApi->get_rentals: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_date** | [****](.md)| Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) | 
 **end_date** | [****](.md)| End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) | 
 **page** | [****](.md)| Page number | [optional] 
 **per_page** | [****](.md)| Page size | [optional] [default to 30]

### Return type

[**RentalsIndex**](RentalsIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json




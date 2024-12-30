# GetAroundOwner::UnavailabilitiesApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method                                                                                  | HTTP request                                    | Description                                           |
| --------------------------------------------------------------------------------------- | ----------------------------------------------- | ----------------------------------------------------- |
| [**create_unavailabilities**](UnavailabilitiesApi.md#create_unavailabilities)           | **POST** /cars/{car_id}/unavailabilities.json   | Create Unavailability related to a car between dates  |
| [**destroy_unavailability**](UnavailabilitiesApi.md#destroy_unavailability)             | **DELETE** /cars/{car_id}/unavailabilities.json | Destroy Unavailability related to a car between dates |
| [**get_unavailabilities_for_car**](UnavailabilitiesApi.md#get_unavailabilities_for_car) | **GET** /cars/{car_id}/unavailabilities.json    | Find Unavailabilities related to a car between dates  |

# **create_unavailabilities**

> create_unavailabilities(car_id, opts)

Create Unavailability related to a car between dates

Set a car as unavailable between 2 dates

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UnavailabilitiesApi.new
car_id = GetAroundOwner::null.new #  | ID of car
opts = {
  body: GetAroundOwner::CarIdUnavailabilitiesJsonBody.new # CarIdUnavailabilitiesJsonBody | Unavailability to create
}

begin
  #Create Unavailability related to a car between dates
  api_instance.create_unavailabilities(car_id, opts)
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UnavailabilitiesApi->create_unavailabilities: #{e}"
end
```

### Parameters

| Name       | Type                                                                  | Description              | Notes      |
| ---------- | --------------------------------------------------------------------- | ------------------------ | ---------- |
| **car_id** | [\*\*\*\*](.md)                                                       | ID of car                |
| **body**   | [**CarIdUnavailabilitiesJsonBody**](CarIdUnavailabilitiesJsonBody.md) | Unavailability to create | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

# **destroy_unavailability**

> destroy_unavailability(car_id)

Destroy Unavailability related to a car between dates

Set a car as available between 2 dates

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UnavailabilitiesApi.new
car_id = GetAroundOwner::null.new #  | ID of car


begin
  #Destroy Unavailability related to a car between dates
  api_instance.destroy_unavailability(car_id)
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UnavailabilitiesApi->destroy_unavailability: #{e}"
end
```

### Parameters

| Name       | Type            | Description | Notes |
| ---------- | --------------- | ----------- | ----- |
| **car_id** | [\*\*\*\*](.md) | ID of car   |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

# **get_unavailabilities_for_car**

> UnavailabilitiesIndex get_unavailabilities_for_car(start_date, end_date, car_id, opts)

Find Unavailabilities related to a car between dates

Find between 2 dates when you’ve set a car as unavailable

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UnavailabilitiesApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
car_id = GetAroundOwner::null.new #  | ID of the car
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find Unavailabilities related to a car between dates
  result = api_instance.get_unavailabilities_for_car(start_date, end_date, car_id, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UnavailabilitiesApi->get_unavailabilities_for_car: #{e}"
end
```

### Parameters

| Name           | Type            | Description                                                                                     | Notes                      |
| -------------- | --------------- | ----------------------------------------------------------------------------------------------- | -------------------------- |
| **start_date** | [\*\*\*\*](.md) | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) |
| **end_date**   | [\*\*\*\*](.md) | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)   |
| **car_id**     | [\*\*\*\*](.md) | ID of the car                                                                                   |
| **page**       | [\*\*\*\*](.md) | Page number                                                                                     | [optional]                 |
| **per_page**   | [\*\*\*\*](.md) | Page size                                                                                       | [optional] [default to 30] |

### Return type

[**UnavailabilitiesIndex**](UnavailabilitiesIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

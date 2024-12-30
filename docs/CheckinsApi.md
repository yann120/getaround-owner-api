# GetAroundOwner::CheckinsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method                                                                  | HTTP request                              | Description                                      |
| ----------------------------------------------------------------------- | ----------------------------------------- | ------------------------------------------------ |
| [**get_checkin_by_rental_id**](CheckinsApi.md#get_checkin_by_rental_id) | **GET** /rentals/{rental_id}/checkin.json | Find a checkin by rental ID                      |
| [**get_checkins**](CheckinsApi.md#get_checkins)                         | **GET** /checkins.json                    | List of checkins that occurred between two dates |

# **get_checkin_by_rental_id**

> Checkin get_checkin_by_rental_id(rental_id)

Find a checkin by rental ID

Find a checkin by rental ID

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckinsApi.new
rental_id = GetAroundOwner::null.new #  | ID of the rental related to the checkin to return


begin
  #Find a checkin by rental ID
  result = api_instance.get_checkin_by_rental_id(rental_id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckinsApi->get_checkin_by_rental_id: #{e}"
end
```

### Parameters

| Name          | Type            | Description                                       | Notes |
| ------------- | --------------- | ------------------------------------------------- | ----- |
| **rental_id** | [\*\*\*\*](.md) | ID of the rental related to the checkin to return |

### Return type

[**Checkin**](Checkin.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

# **get_checkins**

> CheckinsIndex get_checkins(start_date, end_date, opts)

List of checkins that occurred between two dates

List of checkins that occurred between two dates

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckinsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #List of checkins that occurred between two dates
  result = api_instance.get_checkins(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckinsApi->get_checkins: #{e}"
end
```

### Parameters

| Name           | Type            | Description                                                                                     | Notes                      |
| -------------- | --------------- | ----------------------------------------------------------------------------------------------- | -------------------------- |
| **start_date** | [\*\*\*\*](.md) | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) |
| **end_date**   | [\*\*\*\*](.md) | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)   |
| **page**       | [\*\*\*\*](.md) | Page number                                                                                     | [optional]                 |
| **per_page**   | [\*\*\*\*](.md) | Page size                                                                                       | [optional] [default to 30] |

### Return type

[**CheckinsIndex**](CheckinsIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

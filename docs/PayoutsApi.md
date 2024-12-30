# GetAroundOwner::PayoutsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method                                                 | HTTP request               | Description                     |
| ------------------------------------------------------ | -------------------------- | ------------------------------- |
| [**get_payout_by_id**](PayoutsApi.md#get_payout_by_id) | **GET** /payouts/{id}.json | Find a payout by ID             |
| [**get_payouts**](PayoutsApi.md#get_payouts)           | **GET** /payouts.json      | Find payouts paid between dates |

# **get_payout_by_id**

> Payout get_payout_by_id(id)

Find a payout by ID

Find a payout by ID

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::PayoutsApi.new
id = GetAroundOwner::null.new #  | ID of payout to return


begin
  #Find a payout by ID
  result = api_instance.get_payout_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling PayoutsApi->get_payout_by_id: #{e}"
end
```

### Parameters

| Name   | Type            | Description            | Notes |
| ------ | --------------- | ---------------------- | ----- |
| **id** | [\*\*\*\*](.md) | ID of payout to return |

### Return type

[**Payout**](Payout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

# **get_payouts**

> PayoutsIndex get_payouts(start_date, end_date, opts)

Find payouts paid between dates

Find payouts paid between dates

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::PayoutsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find payouts paid between dates
  result = api_instance.get_payouts(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling PayoutsApi->get_payouts: #{e}"
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

[**PayoutsIndex**](PayoutsIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

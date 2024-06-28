# GetAroundOwner::PayoutsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_payout_by_id**](PayoutsApi.md#get_payout_by_id) | **GET** /payouts/{id}.json | Find a payout by ID |
| [**get_payouts**](PayoutsApi.md#get_payouts) | **GET** /payouts.json | Find payouts paid between dates |


## get_payout_by_id

> <GetaroundPayout> get_payout_by_id(id)

Find a payout by ID

Find a payout by ID

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::PayoutsApi.new
id = '1' # String | ID of payout to return

begin
  # Find a payout by ID
  result = api_instance.get_payout_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling PayoutsApi->get_payout_by_id: #{e}"
end
```

#### Using the get_payout_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetaroundPayout>, Integer, Hash)> get_payout_by_id_with_http_info(id)

```ruby
begin
  # Find a payout by ID
  data, status_code, headers = api_instance.get_payout_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetaroundPayout>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling PayoutsApi->get_payout_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of payout to return |  |

### Return type

[**GetaroundPayout**](GetaroundPayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_payouts

> <Array<GetaroundPayoutsIndexInner>> get_payouts(start_date, end_date, opts)

Find payouts paid between dates

Find payouts paid between dates

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::PayoutsApi.new
start_date = Time.parse('2013-10-20T19:20:30+01:00') # Time | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = Time.parse('2013-10-20T19:20:30+01:00') # Time | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: 'page_example', # String | Page number
  per_page: 'per_page_example' # String | Page size
}

begin
  # Find payouts paid between dates
  result = api_instance.get_payouts(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling PayoutsApi->get_payouts: #{e}"
end
```

#### Using the get_payouts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetaroundPayoutsIndexInner>>, Integer, Hash)> get_payouts_with_http_info(start_date, end_date, opts)

```ruby
begin
  # Find payouts paid between dates
  data, status_code, headers = api_instance.get_payouts_with_http_info(start_date, end_date, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetaroundPayoutsIndexInner>>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling PayoutsApi->get_payouts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Time** | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) |  |
| **end_date** | **Time** | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) |  |
| **page** | **String** | Page number | [optional] |
| **per_page** | **String** | Page size | [optional][default to &#39;30&#39;] |

### Return type

[**Array&lt;GetaroundPayoutsIndexInner&gt;**](GetaroundPayoutsIndexInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


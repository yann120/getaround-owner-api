# GetAroundOwner::CheckoutsApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method                                                                     | HTTP request                               | Description                                       |
| -------------------------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------- |
| [**get_checkout_by_rental_id**](CheckoutsApi.md#get_checkout_by_rental_id) | **GET** /rentals/{rental_id}/checkout.json | Find a checkout by rental ID                      |
| [**get_checkouts**](CheckoutsApi.md#get_checkouts)                         | **GET** /checkouts.json                    | List of checkouts that occurred between two dates |

# **get_checkout_by_rental_id**

> Checkout get_checkout_by_rental_id(rental_id)

Find a checkout by rental ID

Find a checkout by rental ID

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckoutsApi.new
rental_id = GetAroundOwner::null.new #  | ID of the rental related to the checkout to return


begin
  #Find a checkout by rental ID
  result = api_instance.get_checkout_by_rental_id(rental_id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckoutsApi->get_checkout_by_rental_id: #{e}"
end
```

### Parameters

| Name          | Type            | Description                                        | Notes |
| ------------- | --------------- | -------------------------------------------------- | ----- |
| **rental_id** | [\*\*\*\*](.md) | ID of the rental related to the checkout to return |

### Return type

[**Checkout**](Checkout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

# **get_checkouts**

> CheckoutsIndex get_checkouts(start_date, end_date, opts)

List of checkouts that occurred between two dates

List of checkouts that occurred between two dates

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckoutsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #List of checkouts that occurred between two dates
  result = api_instance.get_checkouts(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckoutsApi->get_checkouts: #{e}"
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

[**CheckoutsIndex**](CheckoutsIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

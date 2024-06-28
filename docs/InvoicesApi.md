# GetAroundOwner::InvoicesApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_invoice_by_id**](InvoicesApi.md#get_invoice_by_id) | **GET** /invoices/{id}.json | Find an invoice by ID |
| [**get_invoices**](InvoicesApi.md#get_invoices) | **GET** /invoices.json | Find invoices emitted between dates |
| [**get_invoices_for_rental**](InvoicesApi.md#get_invoices_for_rental) | **GET** /rentals/{rental_id}/invoices.json | Find invoices associated to a rental |


## get_invoice_by_id

> <GetaroundInvoice> get_invoice_by_id(id)

Find an invoice by ID

Find an invoice by ID

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::InvoicesApi.new
id = '1' # String | ID of invoice to return

begin
  # Find an invoice by ID
  result = api_instance.get_invoice_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling InvoicesApi->get_invoice_by_id: #{e}"
end
```

#### Using the get_invoice_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetaroundInvoice>, Integer, Hash)> get_invoice_by_id_with_http_info(id)

```ruby
begin
  # Find an invoice by ID
  data, status_code, headers = api_instance.get_invoice_by_id_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetaroundInvoice>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling InvoicesApi->get_invoice_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | ID of invoice to return |  |

### Return type

[**GetaroundInvoice**](GetaroundInvoice.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_invoices

> <Array<GetaroundInvoicesIndexInner>> get_invoices(opts)

Find invoices emitted between dates

Find invoices emitted between dates

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::InvoicesApi.new
opts = {
  start_date: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
  end_date: Time.parse('2013-10-20T19:20:30+01:00'), # Time | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
  page: 'page_example', # String | Page number
  per_page: 'per_page_example' # String | Page size
}

begin
  # Find invoices emitted between dates
  result = api_instance.get_invoices(opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling InvoicesApi->get_invoices: #{e}"
end
```

#### Using the get_invoices_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetaroundInvoicesIndexInner>>, Integer, Hash)> get_invoices_with_http_info(opts)

```ruby
begin
  # Find invoices emitted between dates
  data, status_code, headers = api_instance.get_invoices_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetaroundInvoicesIndexInner>>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling InvoicesApi->get_invoices_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Time** | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) | [optional] |
| **end_date** | **Time** | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) | [optional] |
| **page** | **String** | Page number | [optional] |
| **per_page** | **String** | Page size | [optional][default to &#39;30&#39;] |

### Return type

[**Array&lt;GetaroundInvoicesIndexInner&gt;**](GetaroundInvoicesIndexInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_invoices_for_rental

> <Array<GetaroundRentalInvoicesIndexInner>> get_invoices_for_rental(rental_id, opts)

Find invoices associated to a rental

Find invoices associated to a rental

### Examples

```ruby
require 'time'
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = GetAroundOwner::InvoicesApi.new
rental_id = '1' # String | ID of rental
opts = {
  page: 'page_example', # String | Page number
  per_page: 'per_page_example' # String | Page size
}

begin
  # Find invoices associated to a rental
  result = api_instance.get_invoices_for_rental(rental_id, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Error when calling InvoicesApi->get_invoices_for_rental: #{e}"
end
```

#### Using the get_invoices_for_rental_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetaroundRentalInvoicesIndexInner>>, Integer, Hash)> get_invoices_for_rental_with_http_info(rental_id, opts)

```ruby
begin
  # Find invoices associated to a rental
  data, status_code, headers = api_instance.get_invoices_for_rental_with_http_info(rental_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetaroundRentalInvoicesIndexInner>>
rescue GetAroundOwner::ApiError => e
  puts "Error when calling InvoicesApi->get_invoices_for_rental_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rental_id** | **String** | ID of rental |  |
| **page** | **String** | Page number | [optional] |
| **per_page** | **String** | Page size | [optional][default to &#39;30&#39;] |

### Return type

[**Array&lt;GetaroundRentalInvoicesIndexInner&gt;**](GetaroundRentalInvoicesIndexInner.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


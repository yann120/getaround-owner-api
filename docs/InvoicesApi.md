# GetAroundOwner::InvoicesApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method                                                                | HTTP request                               | Description                          |
| --------------------------------------------------------------------- | ------------------------------------------ | ------------------------------------ |
| [**get_invoice_by_id**](InvoicesApi.md#get_invoice_by_id)             | **GET** /invoices/{id}.json                | Find an invoice by ID                |
| [**get_invoices**](InvoicesApi.md#get_invoices)                       | **GET** /invoices.json                     | Find invoices emitted between dates  |
| [**get_invoices_for_rental**](InvoicesApi.md#get_invoices_for_rental) | **GET** /rentals/{rental_id}/invoices.json | Find invoices associated to a rental |

# **get_invoice_by_id**

> Invoice get_invoice_by_id(id)

Find an invoice by ID

Find an invoice by ID

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::InvoicesApi.new
id = GetAroundOwner::null.new #  | ID of invoice to return


begin
  #Find an invoice by ID
  result = api_instance.get_invoice_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice_by_id: #{e}"
end
```

### Parameters

| Name   | Type            | Description             | Notes |
| ------ | --------------- | ----------------------- | ----- |
| **id** | [\*\*\*\*](.md) | ID of invoice to return |

### Return type

[**Invoice**](Invoice.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

# **get_invoices**

> InvoicesIndex get_invoices(opts)

Find invoices emitted between dates

Find invoices emitted between dates

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::InvoicesApi.new
opts = {
  start_date: GetAroundOwner::null.new, #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
  end_date: GetAroundOwner::null.new, #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find invoices emitted between dates
  result = api_instance.get_invoices(opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoices: #{e}"
end
```

### Parameters

| Name           | Type            | Description                                                                                     | Notes                      |
| -------------- | --------------- | ----------------------------------------------------------------------------------------------- | -------------------------- |
| **start_date** | [\*\*\*\*](.md) | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) | [optional]                 |
| **end_date**   | [\*\*\*\*](.md) | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)   | [optional]                 |
| **page**       | [\*\*\*\*](.md) | Page number                                                                                     | [optional]                 |
| **per_page**   | [\*\*\*\*](.md) | Page size                                                                                       | [optional] [default to 30] |

### Return type

[**InvoicesIndex**](InvoicesIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

# **get_invoices_for_rental**

> RentalInvoicesIndex get_invoices_for_rental(rental_id, opts)

Find invoices associated to a rental

Find invoices associated to a rental

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::InvoicesApi.new
rental_id = GetAroundOwner::null.new #  | ID of rental
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find invoices associated to a rental
  result = api_instance.get_invoices_for_rental(rental_id, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoices_for_rental: #{e}"
end
```

### Parameters

| Name          | Type            | Description  | Notes                      |
| ------------- | --------------- | ------------ | -------------------------- |
| **rental_id** | [\*\*\*\*](.md) | ID of rental |
| **page**      | [\*\*\*\*](.md) | Page number  | [optional]                 |
| **per_page**  | [\*\*\*\*](.md) | Page size    | [optional] [default to 30] |

### Return type

[**RentalInvoicesIndex**](RentalInvoicesIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

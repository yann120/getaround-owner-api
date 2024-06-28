# GetAroundOwner::UnavailabilitiesApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**created_unavailability_post**](UnavailabilitiesApi.md#created_unavailability_post) | **POST** /createdUnavailability | Unavailability created on one of your cars |
| [**deleted_unavailability_post**](UnavailabilitiesApi.md#deleted_unavailability_post) | **POST** /deletedUnavailability | Unavailabilities deleted on one of your cars |


## created_unavailability_post

> created_unavailability_post(opts)

Unavailability created on one of your cars

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::UnavailabilitiesApi.new
opts = {
  getaround_unavailabilities_created:  # GetaroundUnavailabilitiesCreated | This event is triggered whenever an unavailability is created (through the API or directly in the app/website). It shows the unavailability that has just been created, with the same timestamps as those entered by the user. It does not show the changes of other potential overlapping unavailabilities. For example: if an unavailability was already set between June 10 and June 20, and if the user creates a new one between June 18 and June 22, this webhook will only send information about the newly created June 18 - June 22 unavailability. It will not show that, under the hood, the unavailability from June 10 to June 20 has be deleted, and that a new unavailability from June 10 to June 22 has been created.
}

begin
  # Unavailability created on one of your cars
  api_instance.created_unavailability_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling UnavailabilitiesApi->created_unavailability_post: #{e}"
end
```

#### Using the created_unavailability_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> created_unavailability_post_with_http_info(opts)

```ruby
begin
  # Unavailability created on one of your cars
  data, status_code, headers = api_instance.created_unavailability_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling UnavailabilitiesApi->created_unavailability_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_unavailabilities_created** | [**GetaroundUnavailabilitiesCreated**](GetaroundUnavailabilitiesCreated.md) | This event is triggered whenever an unavailability is created (through the API or directly in the app/website). It shows the unavailability that has just been created, with the same timestamps as those entered by the user. It does not show the changes of other potential overlapping unavailabilities. For example: if an unavailability was already set between June 10 and June 20, and if the user creates a new one between June 18 and June 22, this webhook will only send information about the newly created June 18 - June 22 unavailability. It will not show that, under the hood, the unavailability from June 10 to June 20 has be deleted, and that a new unavailability from June 10 to June 22 has been created. | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## deleted_unavailability_post

> deleted_unavailability_post(opts)

Unavailabilities deleted on one of your cars

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::UnavailabilitiesApi.new
opts = {
  getaround_unavailabilities_deleted:  # GetaroundUnavailabilitiesDeleted | This event is triggered whenever an unavailability is deleted (through the API or directly in the app/website). It shows the unavailability that has just been deleted, with the same timestamps as those entered by the user. It does not show the changes of other potential overlapping unavailabilities. For example: if an unavailability was already set between June 10 and June 20, and if the user deletes an unavailability between June 18 and June 22 (to set their car as available between this dates), this webhook will only send information about the newly deleted June 18 - June 22 unavailability. It will not show that, under the hood, the unavailability from June 10 to June 20 has be deleted, and that a new unavailability from June 10 to June 18 has been created.
}

begin
  # Unavailabilities deleted on one of your cars
  api_instance.deleted_unavailability_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling UnavailabilitiesApi->deleted_unavailability_post: #{e}"
end
```

#### Using the deleted_unavailability_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> deleted_unavailability_post_with_http_info(opts)

```ruby
begin
  # Unavailabilities deleted on one of your cars
  data, status_code, headers = api_instance.deleted_unavailability_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling UnavailabilitiesApi->deleted_unavailability_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_unavailabilities_deleted** | [**GetaroundUnavailabilitiesDeleted**](GetaroundUnavailabilitiesDeleted.md) | This event is triggered whenever an unavailability is deleted (through the API or directly in the app/website). It shows the unavailability that has just been deleted, with the same timestamps as those entered by the user. It does not show the changes of other potential overlapping unavailabilities. For example: if an unavailability was already set between June 10 and June 20, and if the user deletes an unavailability between June 18 and June 22 (to set their car as available between this dates), this webhook will only send information about the newly deleted June 18 - June 22 unavailability. It will not show that, under the hood, the unavailability from June 10 to June 20 has be deleted, and that a new unavailability from June 10 to June 18 has been created. | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


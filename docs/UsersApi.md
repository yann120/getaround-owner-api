# GetAroundOwner::UsersApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**updated_user_post**](UsersApi.md#updated_user_post) | **POST** /updatedUser | User updated his profile information |


## updated_user_post

> updated_user_post(opts)

User updated his profile information

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::UsersApi.new
opts = {
  getaround_users_updated:  # GetaroundUsersUpdated | This event is triggered when a user updates his profile information (You will only receive this event on users with a booked rental or a started rental).
}

begin
  # User updated his profile information
  api_instance.updated_user_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling UsersApi->updated_user_post: #{e}"
end
```

#### Using the updated_user_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> updated_user_post_with_http_info(opts)

```ruby
begin
  # User updated his profile information
  data, status_code, headers = api_instance.updated_user_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling UsersApi->updated_user_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_users_updated** | [**GetaroundUsersUpdated**](GetaroundUsersUpdated.md) | This event is triggered when a user updates his profile information (You will only receive this event on users with a booked rental or a started rental). | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


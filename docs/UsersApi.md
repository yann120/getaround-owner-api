# GetAroundOwner::UsersApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method                                           | HTTP request             | Description                                                       |
| ------------------------------------------------ | ------------------------ | ----------------------------------------------------------------- |
| [**get_user_by_id**](UsersApi.md#get_user_by_id) | **GET** /users/{id}.json | Find a user by ID (Users are customers who rent one of your cars) |

# **get_user_by_id**

> User get_user_by_id(id)

Find a user by ID (Users are customers who rent one of your cars)

Find a user by ID (Users are customers who rent one of your cars)

### Example

```ruby
# load the gem
require 'get_around_owner'
# setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UsersApi.new
id = GetAroundOwner::null.new #  | ID of user to return


begin
  #Find a user by ID (Users are customers who rent one of your cars)
  result = api_instance.get_user_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UsersApi->get_user_by_id: #{e}"
end
```

### Parameters

| Name   | Type            | Description          | Notes |
| ------ | --------------- | -------------------- | ----- |
| **id** | [\*\*\*\*](.md) | ID of user to return |

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

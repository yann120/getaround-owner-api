# GetAroundOwner::MessagesApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**sent_message_post**](MessagesApi.md#sent_message_post) | **POST** /sentMessage | New message sent |


## sent_message_post

> sent_message_post(opts)

New message sent

### Examples

```ruby
require 'time'
require 'get_around_owner'

api_instance = GetAroundOwner::MessagesApi.new
opts = {
  getaround_messages_sent:  # GetaroundMessagesSent | This event is triggered when a new message has been sent for one of your rentals
}

begin
  # New message sent
  api_instance.sent_message_post(opts)
rescue GetAroundOwner::ApiError => e
  puts "Error when calling MessagesApi->sent_message_post: #{e}"
end
```

#### Using the sent_message_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> sent_message_post_with_http_info(opts)

```ruby
begin
  # New message sent
  data, status_code, headers = api_instance.sent_message_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue GetAroundOwner::ApiError => e
  puts "Error when calling MessagesApi->sent_message_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **getaround_messages_sent** | [**GetaroundMessagesSent**](GetaroundMessagesSent.md) | This event is triggered when a new message has been sent for one of your rentals | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


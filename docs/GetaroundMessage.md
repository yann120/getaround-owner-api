# GetAroundOwner::GetaroundMessage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The message ID |  |
| **rental_id** | **Integer** | ID of the related rental |  |
| **sending_user_id** | **Integer** | ID of the sending user |  |
| **sent_at** | **String** | Date the message was sent |  |
| **content** | **String** | Content of message, Personal information detected in messages is hidden |  |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundMessage.new(
  id: null,
  rental_id: null,
  sending_user_id: null,
  sent_at: null,
  content: null
)
```


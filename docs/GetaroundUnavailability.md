# GetAroundOwner::GetaroundUnavailability

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **car_id** | **Integer** | ID of the related car |  |
| **starts_at** | **Time** | The ISO8601 formatted beginning of the unavailability&#39;s period |  |
| **ends_at** | **Time** | The ISO8601 formatted ending of the unavailability&#39;s period |  |
| **reason** | **String** | The reason of the unavailability of the car. | [optional] |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundUnavailability.new(
  car_id: null,
  starts_at: null,
  ends_at: null,
  reason: null
)
```


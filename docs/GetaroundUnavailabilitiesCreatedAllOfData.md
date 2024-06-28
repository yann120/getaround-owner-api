# GetAroundOwner::GetaroundUnavailabilitiesCreatedAllOfData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **car_id** | **Integer** | ID of the related car | [optional] |
| **starts_at** | **Time** | The ISO8601 formatted beginning of the unavailability&#39;s period | [optional] |
| **ends_at** | **Time** | The ISO8601 formatted ending of the unavailability&#39;s period | [optional] |
| **reason** | [**GetaroundReason**](GetaroundReason.md) |  | [optional] |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundUnavailabilitiesCreatedAllOfData.new(
  car_id: null,
  starts_at: null,
  ends_at: null,
  reason: null
)
```


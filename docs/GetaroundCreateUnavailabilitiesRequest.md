# GetAroundOwner::GetaroundCreateUnavailabilitiesRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **starts_at** | **Time** | Start date and time of the unavailability in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) with a 30 min granularity. |  |
| **ends_at** | **Time** | End date and time of the unavailability in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) with a 30 min granularity. |  |
| **reason** | **String** | Reason of the unavailability | [optional] |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundCreateUnavailabilitiesRequest.new(
  starts_at: null,
  ends_at: null,
  reason: null
)
```


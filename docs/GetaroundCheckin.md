# GetAroundOwner::GetaroundCheckin

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rental_id** | **Integer** | Rental&#39;s ID linked to this checkin |  |
| **mileage** | **Integer** | The vehicle’s mileage at checkin (in local units, eg: FR: km, GB: miles, ...) | [optional] |
| **fuel_level** | **Integer** | The vehicle’s fuel level at checkin (in percentage) | [optional] |
| **occurred_at** | **Time** | Checkin&#39;s time in ISO8601 format |  |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundCheckin.new(
  rental_id: null,
  mileage: null,
  fuel_level: null,
  occurred_at: null
)
```


# GetAroundOwner::GetaroundCheckout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rental_id** | **Integer** | Rental&#39;s ID linked to this checkout |  |
| **mileage** | **Integer** | The vehicle’s mileage at checkout (in local units, eg: FR: km, GB: miles, ...) | [optional] |
| **fuel_level** | **Integer** | The vehicle’s fuel level at checkout (in percentage) | [optional] |
| **distance_driven** | **Integer** | The number of kilometers driven during this rental |  |
| **occurred_at** | **Time** | Checkout&#39;s time in ISO8601 format |  |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundCheckout.new(
  rental_id: null,
  mileage: null,
  fuel_level: null,
  distance_driven: null,
  occurred_at: null
)
```


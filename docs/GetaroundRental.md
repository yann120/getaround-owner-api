# GetAroundOwner::GetaroundRental

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Rental&#39;s id |  |
| **car_id** | **Integer** | Vehicle&#39;s id |  |
| **user_id** | **Integer** | User id of the rental&#39;s driver |  |
| **starts_at** | **Time** | Rental&#39;s started time in ISO8601 format |  |
| **ends_at** | **Time** | Rental&#39;s ended time in ISO8601 format |  |
| **booked_at** | **Time** | Rental&#39;s booked time in ISO8601 format |  |
| **price** | **Integer** | Price set by the owner (in cents 0.01€) |  |
| **insurance_fee** | **Integer** | Insurance amount collected (in cents 0.01€) |  |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundRental.new(
  id: null,
  car_id: null,
  user_id: null,
  starts_at: null,
  ends_at: null,
  booked_at: null,
  price: null,
  insurance_fee: null
)
```


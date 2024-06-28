# GetAroundOwner::GetaroundCar

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The car ID |  |
| **state** | **String** | State of the vehicle can be a) active (only state where the vehicle can be booked by a user) b) inactive (temporary state when a vehicle is unavailable for rental) c) pending_approval (temporary state when a vehicle is under review for quality or other checks) and d) deleted (when a vehicle is permanently unavailable for rental) |  |
| **plate_number** | **String** | Vehicle&#39;s plate number |  |
| **brand** | **String** | Vehicle&#39;s brand (ex: Volkswagen) |  |
| **model** | **String** | Vehicle&#39;s model (ex: Polo) |  |
| **display_address** | **String** | Location where the vehicle is parked |  |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundCar.new(
  id: null,
  state: null,
  plate_number: null,
  brand: null,
  model: null,
  display_address: null
)
```


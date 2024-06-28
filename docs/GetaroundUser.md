# GetAroundOwner::GetaroundUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The user ID |  |
| **first_name** | **String** | First name(s) |  |
| **last_name** | **String** | Last name(s) |  |
| **phone_number** | **String** | The phone number in international format |  |
| **address_line1** | **String** | Residential address of the user |  |
| **address_line2** | **String** | Additional address details | [optional] |
| **postal_code** | **String** | The postal code |  |
| **city** | **String** | The city |  |
| **country** | **String** | Address&#39;s country format ISO_3166-1_alpha-2 (ex: FR, ES, ...) |  |
| **birth_date** | **Date** | The birth date |  |
| **license_country** | **String** | Driving licence country of issue format ISO_3166-1_alpha-2 (ex: FR, ES, ...) |  |
| **license_first_issue_date** | **Date** | Driving licence first issue date |  |
| **license_number** | **String** | The license number |  |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundUser.new(
  id: null,
  first_name: null,
  last_name: null,
  phone_number: null,
  address_line1: null,
  address_line2: null,
  postal_code: null,
  city: null,
  country: null,
  birth_date: null,
  license_country: null,
  license_first_issue_date: null,
  license_number: null
)
```


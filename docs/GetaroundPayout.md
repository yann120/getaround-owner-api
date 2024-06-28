# GetAroundOwner::GetaroundPayout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The payout ID |  |
| **amount** | **Integer** | The amount of the payout, in cents (0.01€) |  |
| **currency** | **String** | The currency of the payout (ISO 4217 alphabetic code) |  |
| **completed_at** | **Time** | The ISO8601 formatted payout completion date |  |
| **entity_type** | **String** | The type of entity the payout is related to |  |
| **invoices** | [**Array&lt;GetaroundPayoutInvoicesInner&gt;**](GetaroundPayoutInvoicesInner.md) | An array of invoices paid by this payout | [optional] |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundPayout.new(
  id: null,
  amount: null,
  currency: null,
  completed_at: null,
  entity_type: null,
  invoices: null
)
```


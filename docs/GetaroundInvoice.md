# GetAroundOwner::GetaroundInvoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The invoice ID |  |
| **pdf_url** | **String** | The temporary url (lifetime: 20min) to download the pdf of the tax invoice is generated each to time you call the endpoint. Also, the &#39;links&#39; variable will not be present if there is no uploaded invoice yet. This could happen if the job to generate &amp; upload the invoice is not done yet. |  |
| **product_type** | **String** | The type of product the invoice is related to |  |
| **product_id** | **Integer** | The id of the product the invoice is related to |  |
| **emitted_at** | **Time** | The date at which the invoice was emitted |  |
| **total_price** | **Integer** | The invoice amount, which is what you will receive (or which will be debited from your account if it is negative) |  |
| **currency** | **String** | The currency of the invoice amount (ISO 4217 alphabetic code) |  |
| **entity_type** | **String** | The type of entity the invoice is related to |  |
| **charges** | [**Array&lt;GetaroundInvoiceChargesInner&gt;**](GetaroundInvoiceChargesInner.md) | Array of charges | [optional] |

## Example

```ruby
require 'get_around_owner'

instance = GetAroundOwner::GetaroundInvoice.new(
  id: null,
  pdf_url: null,
  product_type: null,
  product_id: null,
  emitted_at: null,
  total_price: null,
  currency: null,
  entity_type: null,
  charges: null
)
```


# GetAroundOwner::Invoice

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | [****](.md) | The invoice ID | 
**pdf_url** | [****](.md) | The temporary url (lifetime: 20min) to download the pdf of the tax invoice is generated each to time you call the endpoint. Also, the &#x27;links&#x27; variable will not be present if there is no uploaded invoice yet. This could happen if the job to generate &amp; upload the invoice is not done yet. | 
**product_type** | [****](.md) | The type of product the invoice is related to | 
**product_id** | [****](.md) | The id of the product the invoice is related to | 
**emitted_at** | [****](.md) | The date at which the invoice was emitted | 
**total_price** | [****](.md) | The invoice amount, which is what you will receive (or which will be debited from your account if it is negative) | 
**currency** | [****](.md) | The currency of the invoice amount (ISO 4217 alphabetic code) | 
**entity_type** | [****](.md) | The type of entity the invoice is related to | 
**charges** | [****](.md) | Array of charges | [optional] 


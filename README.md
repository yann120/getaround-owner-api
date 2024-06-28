# get_around_owner

GetAroundOwner - the Ruby gem for the Getaround Owner API

# Quick Start

The Owner API uses the JSON format, and must be accessed over a [secure connection](https://en.wikipedia.org/wiki/HTTPS).

Let’s assume that the access token provided by your account manager is “TOKEN”.

Here’s how to get the list of ids of all your invoices from the first week of August with a shell script:

```bash
query=\"end_date=2018-08-08T00%3A00%3A00%2B00%3A00&start_date=2018-08-01T00%3A00%3A00%2B00%3A00\"

curl -i \"https://api-eu.getaround.com/owner/v1/invoices?${query}\" \\
  -H \"Authorization: Bearer TOKEN\" \\
  -H \"Accept:application/json\" \\
  -H \"Content-Type:application/json\"
```

And here’s how to get the invoice with the id 12345:

```bash
curl -i \"https://api-eu.getaround.com/owner/v1/invoices/12345\" \\
  -H \"Authorization: Bearer TOKEN\" \\
  -H \"Accept: application/json\" \\
  -H \"Content-Type: application/json\"\"
```

See the [endpoints section](#tag/Invoices) of this guide for details about the response format.

Dates in request params should follow the ISO 8601 standard.


# Authentication

All requests must be authenticated with a [bearer token header](https://tools.ietf.org/html/rfc6750#section-2.1). You token will be sent to you by your account manager.

Unauthenticated requests will return a 401 status.


# Pagination

The page number and the number of items per page can be set with the “page” and “per_page” params.

For example, this request will return the second page of invoices, and 50 invoices per page:

`https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50`

Both of these params are optional. The default page size is 30 items.

The Getaround Owner API follows the [RFC 8288 convention](https://datatracker.ietf.org/doc/html/rfc8288) of using the `Link` header to provide the `next` page URL. Please don't build the pagination URLs yourself.
The `next` page will be missing when you are requesting the last available page.

Here's an example response header from requesting the second page of invoices `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50`
```
Link: <https://api-eu.getaround.com/owner/v1/invoices?page=3&per_page=50>; rel=\"next\"
```


# Throttling policy and Date range limitation

We have throttling policy that prevents you to perform more than 100 requests per min from the same IP.

Also, there is a limitation on the size of the range of dates given in params in some requests.

All requests that need start_date and end_date, do not accept a range bigger than 30 days.


# Webhooks

Getaround can send webhook events that notify your application when certain events happen on your account. This is especially useful to follow the lifecycle of rentals, tracking for example bookings or cancellations.

### Setup

To set up an endpoint, you need to define a route on your server for receiving events, and then <a href=\"mailto:owner-api@getaround.com\">ask Getaround</a> to add this URL to your account.

To acknowledge receipt of a event, your endpoint must:

- Return a `2xx` HTTP status code.
- Be a secure `https` endpoint with a valid SSL certificate.

### Testing

Once Getaround has set up the endpoint, and it is properly configured as described above, a test `ping` event can be sent by clicking the button below:

<form action=\"/docs/api/owner/fire_ping_webhook\" method=\"post\"><input type=\"submit\" value=\"Send Ping Event\"></form>

You should receive the following JSON payload:

```json
{
  \"data\": {
    \"ping\": \"pong\"
  },
  \"type\": \"ping\",
  \"occurred_at\": \"2019-04-18T08:30:05Z\"
}
```

### Retries

Webhook deliveries will be attempted for up to three days with an exponential back off. After that point the delivery will be abandoned.

### Verifying Signatures

Getaround will also provide you with a secret token, which is used to create a hash signature with each payload.

This hash signature is passed along with each request in the headers as `X-Drivy-Signature`. Suppose you have a basic server listening to webhooks that looks like this:

```ruby
require 'sinatra'
require 'json'

post '/payload' do
  push = JSON.parse(params[:payload])
  \"I got some JSON: \#{push.inspect}\"
end
```

The goal is to compute a hash using your secret token, and ensure that the hash from Getaround matches. Getaround uses an HMAC hexdigest to compute the hash, so you could change your server to look a little like this:

```ruby
post '/payload' do
  request.body.rewind
  payload_body = request.body.read
  verify_signature(payload_body)
  push = JSON.parse(params[:payload])
  \"I got some JSON: \#{push.inspect}\"
end

def verify_signature(payload_body)
  signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)
  return halt 500, \"Signatures didn't match!\" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_DRIVY_SIGNATURE'])
end
```

Obviously, your language and server implementations may differ from this code. There are a couple of important things to point out, however:

No matter which implementation you use, the hash signature starts with `sha1=`, using the key of your secret token and your payload body.

Using a plain `==` operator is not advised. A method like secure_compare performs a \"constant time\" string comparison, which renders it safe from certain timing attacks against regular equality operators.

### Best Practices

- **Acknowledge events immediately**. If your webhook script performs complex logic, or makes network calls, it’s possible that the script would time out before Getaround sees its complete execution. Ideally, your webhook handler code (acknowledging receipt of an event by returning a `2xx` status code) is separate of any other logic you do for that event.
- **Handle duplicate events**. Webhook endpoints might occasionally receive the same event more than once. We advise you to guard against duplicated event receipts by making your event processing idempotent. One way of doing this is logging the events you’ve processed, and then not processing already-logged events.
- **Do not expect events in order**. Getaround does not guarantee delivery of events in the order in which they are generated. Your endpoint should therefore handle this accordingly. We do provide an `occurred_at` timestamp for each event, though, to help reconcile ordering.


This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- Package version: 1.0.0
- Generator version: 7.6.0
- Build package: org.openapitools.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build get_around_owner.gemspec
```

Then either install the gem locally:

```shell
gem install ./get_around_owner-1.0.0.gem
```

(for development, run `gem install --dev ./get_around_owner-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'get_around_owner', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'get_around_owner', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'get_around_owner'

# Setup authorization
GetAroundOwner.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
  # Configure a proc to get access tokens in lieu of the static access_token configuration
  config.access_token_getter = -> { 'YOUR TOKEN GETTER PROC' } 
end

api_instance = GetAroundOwner::CarsApi.new
id = '1' # String | ID of car to return

begin
  #Find a car by ID
  result = api_instance.get_car_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CarsApi->get_car_by_id: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*GetAroundOwner::CarsApi* | [**get_car_by_id**](docs/CarsApi.md#get_car_by_id) | **GET** /cars/{id}.json | Find a car by ID
*GetAroundOwner::CarsApi* | [**get_cars**](docs/CarsApi.md#get_cars) | **GET** /cars.json | Find all cars
*GetAroundOwner::CheckinsApi* | [**get_checkin_by_rental_id**](docs/CheckinsApi.md#get_checkin_by_rental_id) | **GET** /rentals/{rental_id}/checkin.json | Find a checkin by rental ID
*GetAroundOwner::CheckinsApi* | [**get_checkins**](docs/CheckinsApi.md#get_checkins) | **GET** /checkins.json | List of checkins that occurred between two dates
*GetAroundOwner::CheckoutsApi* | [**get_checkout_by_rental_id**](docs/CheckoutsApi.md#get_checkout_by_rental_id) | **GET** /rentals/{rental_id}/checkout.json | Find a checkout by rental ID
*GetAroundOwner::CheckoutsApi* | [**get_checkouts**](docs/CheckoutsApi.md#get_checkouts) | **GET** /checkouts.json | List of checkouts that occurred between two dates
*GetAroundOwner::InvoicesApi* | [**get_invoice_by_id**](docs/InvoicesApi.md#get_invoice_by_id) | **GET** /invoices/{id}.json | Find an invoice by ID
*GetAroundOwner::InvoicesApi* | [**get_invoices**](docs/InvoicesApi.md#get_invoices) | **GET** /invoices.json | Find invoices emitted between dates
*GetAroundOwner::InvoicesApi* | [**get_invoices_for_rental**](docs/InvoicesApi.md#get_invoices_for_rental) | **GET** /rentals/{rental_id}/invoices.json | Find invoices associated to a rental
*GetAroundOwner::MessagesApi* | [**create_messages**](docs/MessagesApi.md#create_messages) | **POST** /rentals/{rental_id}/messages.json | Create Message associated to a rental
*GetAroundOwner::MessagesApi* | [**get_message_by_id**](docs/MessagesApi.md#get_message_by_id) | **GET** /rentals/{rental_id}/messages/{id}.json | Find a message by ID associated to a rental
*GetAroundOwner::MessagesApi* | [**get_messages_for_rental**](docs/MessagesApi.md#get_messages_for_rental) | **GET** /rentals/{rental_id}/messages.json | Find messages associated to a rental
*GetAroundOwner::PayoutsApi* | [**get_payout_by_id**](docs/PayoutsApi.md#get_payout_by_id) | **GET** /payouts/{id}.json | Find a payout by ID
*GetAroundOwner::PayoutsApi* | [**get_payouts**](docs/PayoutsApi.md#get_payouts) | **GET** /payouts.json | Find payouts paid between dates
*GetAroundOwner::RentalsApi* | [**get_rental_by_id**](docs/RentalsApi.md#get_rental_by_id) | **GET** /rentals/{id}.json | Find a rental by ID
*GetAroundOwner::RentalsApi* | [**get_rentals**](docs/RentalsApi.md#get_rentals) | **GET** /rentals.json | Find rentals booked between dates
*GetAroundOwner::UnavailabilitiesApi* | [**create_unavailabilities**](docs/UnavailabilitiesApi.md#create_unavailabilities) | **POST** /cars/{car_id}/unavailabilities.json | Create Unavailability related to a car between dates
*GetAroundOwner::UnavailabilitiesApi* | [**destroy_unavailability**](docs/UnavailabilitiesApi.md#destroy_unavailability) | **DELETE** /cars/{car_id}/unavailabilities.json | Destroy Unavailability related to a car between dates
*GetAroundOwner::UnavailabilitiesApi* | [**get_unavailabilities_for_car**](docs/UnavailabilitiesApi.md#get_unavailabilities_for_car) | **GET** /cars/{car_id}/unavailabilities.json | Find Unavailabilities related to a car between dates
*GetAroundOwner::UsersApi* | [**get_user_by_id**](docs/UsersApi.md#get_user_by_id) | **GET** /users/{id}.json | Find a user by ID (Users are customers who rent one of your cars)


## Documentation for Models

 - [GetAroundOwner::GetaroundCar](docs/GetaroundCar.md)
 - [GetAroundOwner::GetaroundCarsIndexInner](docs/GetaroundCarsIndexInner.md)
 - [GetAroundOwner::GetaroundCheckin](docs/GetaroundCheckin.md)
 - [GetAroundOwner::GetaroundCheckinsIndexInner](docs/GetaroundCheckinsIndexInner.md)
 - [GetAroundOwner::GetaroundCheckout](docs/GetaroundCheckout.md)
 - [GetAroundOwner::GetaroundCreateMessagesRequest](docs/GetaroundCreateMessagesRequest.md)
 - [GetAroundOwner::GetaroundCreateUnavailabilitiesRequest](docs/GetaroundCreateUnavailabilitiesRequest.md)
 - [GetAroundOwner::GetaroundDestroyUnavailabilityRequest](docs/GetaroundDestroyUnavailabilityRequest.md)
 - [GetAroundOwner::GetaroundInvoice](docs/GetaroundInvoice.md)
 - [GetAroundOwner::GetaroundInvoiceChargesInner](docs/GetaroundInvoiceChargesInner.md)
 - [GetAroundOwner::GetaroundInvoicesIndexInner](docs/GetaroundInvoicesIndexInner.md)
 - [GetAroundOwner::GetaroundMessage](docs/GetaroundMessage.md)
 - [GetAroundOwner::GetaroundMessagesSent](docs/GetaroundMessagesSent.md)
 - [GetAroundOwner::GetaroundMessagesSentAllOfData](docs/GetaroundMessagesSentAllOfData.md)
 - [GetAroundOwner::GetaroundPayout](docs/GetaroundPayout.md)
 - [GetAroundOwner::GetaroundPayoutInvoicesInner](docs/GetaroundPayoutInvoicesInner.md)
 - [GetAroundOwner::GetaroundPayoutsIndexInner](docs/GetaroundPayoutsIndexInner.md)
 - [GetAroundOwner::GetaroundReason](docs/GetaroundReason.md)
 - [GetAroundOwner::GetaroundRental](docs/GetaroundRental.md)
 - [GetAroundOwner::GetaroundRentalInvoicesIndexInner](docs/GetaroundRentalInvoicesIndexInner.md)
 - [GetAroundOwner::GetaroundRentalMessagesIndexInner](docs/GetaroundRentalMessagesIndexInner.md)
 - [GetAroundOwner::GetaroundRentalsBooked](docs/GetaroundRentalsBooked.md)
 - [GetAroundOwner::GetaroundRentalsBookedAllOfData](docs/GetaroundRentalsBookedAllOfData.md)
 - [GetAroundOwner::GetaroundRentalsCanceled](docs/GetaroundRentalsCanceled.md)
 - [GetAroundOwner::GetaroundRentalsCarCheckedIn](docs/GetaroundRentalsCarCheckedIn.md)
 - [GetAroundOwner::GetaroundRentalsCarCheckedOut](docs/GetaroundRentalsCarCheckedOut.md)
 - [GetAroundOwner::GetaroundRentalsCarSwitched](docs/GetaroundRentalsCarSwitched.md)
 - [GetAroundOwner::GetaroundRentalsIndexInner](docs/GetaroundRentalsIndexInner.md)
 - [GetAroundOwner::GetaroundRentalsTimesChanged](docs/GetaroundRentalsTimesChanged.md)
 - [GetAroundOwner::GetaroundUnavailabilitiesCreated](docs/GetaroundUnavailabilitiesCreated.md)
 - [GetAroundOwner::GetaroundUnavailabilitiesCreatedAllOfData](docs/GetaroundUnavailabilitiesCreatedAllOfData.md)
 - [GetAroundOwner::GetaroundUnavailabilitiesDeleted](docs/GetaroundUnavailabilitiesDeleted.md)
 - [GetAroundOwner::GetaroundUnavailabilitiesDeletedAllOfData](docs/GetaroundUnavailabilitiesDeletedAllOfData.md)
 - [GetAroundOwner::GetaroundUnavailability](docs/GetaroundUnavailability.md)
 - [GetAroundOwner::GetaroundUser](docs/GetaroundUser.md)
 - [GetAroundOwner::GetaroundUsersUpdated](docs/GetaroundUsersUpdated.md)
 - [GetAroundOwner::GetaroundUsersUpdatedAllOfData](docs/GetaroundUsersUpdatedAllOfData.md)
 - [GetAroundOwner::GetaroundWebhook](docs/GetaroundWebhook.md)


## Documentation for Authorization


Authentication schemes defined for the API:
### bearerAuth

- **Type**: Bearer authentication


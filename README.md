# get_around_owner

GetAroundOwner - the Ruby gem for the Getaround Owner API

# Quick Start The Owner API uses the JSON format, and must be accessed over a [secure connection](https://en.wikipedia.org/wiki/HTTPS). Let’s assume that the access token provided by your account manager is “TOKEN”. Here’s how to get the list of ids of all your invoices from the first week of August with a shell script: `bash query=\"end_date=2018-08-08T00%3A00%3A00%2B00%3A00&start_date=2018-08-01T00%3A00%3A00%2B00%3A00\"  curl -i \"https://api-eu.getaround.com/owner/v1/invoices?${query}\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept:application/json\" \\   -H \"Content-Type:application/json\" ` And here’s how to get the invoice with the id 12345: `bash curl -i \"https://api-eu.getaround.com/owner/v1/invoices/12345\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept: application/json\" \\   -H \"Content-Type: application/json\"\" ` See the [endpoints section](#tag/Invoices) of this guide for details about the response format. Dates in request params should follow the ISO 8601 standard. # Authentication All requests must be authenticated with a [bearer token header](https://tools.ietf.org/html/rfc6750#section-2.1). You token will be sent to you by your account manager. Unauthenticated requests will return a 401 status. # Pagination The page number and the number of items per page can be set with the “page” and “per_page” params. For example, this request will return the second page of invoices, and 50 invoices per page: `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50` Both of these params are optional. The default page size is 30 items. The Getaround Owner API follows the [RFC 8288 convention](https://datatracker.ietf.org/doc/html/rfc8288) of using the `Link` header to provide the `next` page URL. Please don't build the pagination URLs yourself. The `next` page will be missing when you are requesting the last available page. Here's an example response header from requesting the second page of invoices `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50` `Link: <https://api-eu.getaround.com/owner/v1/invoices?page=3&per_page=50>; rel=\"next\"` # Throttling policy and Date range limitation We have throttling policy that prevents you to perform more than 100 requests per min from the same IP. Also, there is a limitation on the size of the range of dates given in params in some requests. All requests that need start_date and end_date, do not accept a range bigger than 30 days. # Webhooks Getaround can send webhook events that notify your application when certain events happen on your account. This is especially useful to follow the lifecycle of rentals, tracking for example bookings or cancellations. ### Setup To set up an endpoint, you need to define a route on your server for receiving events, and then <a href=\"mailto:owner-api@getaround.com\">ask Getaround</a> to add this URL to your account. To acknowledge receipt of a event, your endpoint must: - Return a `2xx` HTTP status code. - Be a secure `https` endpoint with a valid SSL certificate. ### Testing Once Getaround has set up the endpoint, and it is properly configured as described above, a test `ping` event can be sent by clicking the button below: <form action=\"/docs/api/owner/fire_ping_webhook\" method=\"post\"><input type=\"submit\" value=\"Send Ping Event\"></form> You should receive the following JSON payload: `json {   \"data\": {     \"ping\": \"pong\"   },   \"type\": \"ping\",   \"occurred_at\": \"2019-04-18T08:30:05Z\" } ` ### Retries Webhook deliveries will be attempted for up to three days with an exponential back off. After that point the delivery will be abandoned. ### Verifying Signatures Getaround will also provide you with a secret token, which is used to create a hash signature with each payload. This hash signature is passed along with each request in the headers as `X-Drivy-Signature`. Suppose you have a basic server listening to webhooks that looks like this: `ruby require 'sinatra' require 'json'  post '/payload' do   push = JSON.parse(params[:payload])   \"I got some JSON: #{push.inspect}\" end ` The goal is to compute a hash using your secret token, and ensure that the hash from Getaround matches. Getaround uses an HMAC hexdigest to compute the hash, so you could change your server to look a little like this: `ruby post '/payload' do   request.body.rewind   payload_body = request.body.read   verify_signature(payload_body)   push = JSON.parse(params[:payload])   \"I got some JSON: #{push.inspect}\" end  def verify_signature(payload_body)   signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)   return halt 500, \"Signatures didn't match!\" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_DRIVY_SIGNATURE']) end ` Obviously, your language and server implementations may differ from this code. There are a couple of important things to point out, however: No matter which implementation you use, the hash signature starts with `sha1=`, using the key of your secret token and your payload body. Using a plain `==` operator is not advised. A method like secure_compare performs a \"constant time\" string comparison, which renders it safe from certain timing attacks against regular equality operators. ### Best Practices - **Acknowledge events immediately**. If your webhook script performs complex logic, or makes network calls, it’s possible that the script would time out before Getaround sees its complete execution. Ideally, your webhook handler code (acknowledging receipt of an event by returning a `2xx` status code) is separate of any other logic you do for that event. - **Handle duplicate events**. Webhook endpoints might occasionally receive the same event more than once. We advise you to guard against duplicated event receipts by making your event processing idempotent. One way of doing this is logging the events you’ve processed, and then not processing already-logged events. - **Do not expect events in order**. Getaround does not guarantee delivery of events in the order in which they are generated. Your endpoint should therefore handle this accordingly. We do provide an `occurred_at` timestamp for each event, though, to help reconcile ordering.

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0.0
- Package version: 1.0.6
- Build package: io.swagger.codegen.v3.generators.ruby.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build get_around_owner.gemspec
```

Then either install the gem locally:

```shell
gem install ./get_around_owner-1.0.6.gem
```

(for development, run `gem install --dev ./get_around_owner-1.0.6.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'get_around_owner', '~> 1.0.6'

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
end

api_instance = GetAroundOwner::CarsApi.new
id = GetAroundOwner::null.new #  | ID of car to return


begin
  #Find a car by ID
  result = api_instance.get_car_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CarsApi->get_car_by_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CarsApi.new
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find all cars
  result = api_instance.get_cars(opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CarsApi->get_cars: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckinsApi.new
rental_id = GetAroundOwner::null.new #  | ID of the rental related to the checkin to return


begin
  #Find a checkin by rental ID
  result = api_instance.get_checkin_by_rental_id(rental_id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckinsApi->get_checkin_by_rental_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckinsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #List of checkins that occurred between two dates
  result = api_instance.get_checkins(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckinsApi->get_checkins: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckoutsApi.new
rental_id = GetAroundOwner::null.new #  | ID of the rental related to the checkout to return


begin
  #Find a checkout by rental ID
  result = api_instance.get_checkout_by_rental_id(rental_id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckoutsApi->get_checkout_by_rental_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::CheckoutsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #List of checkouts that occurred between two dates
  result = api_instance.get_checkouts(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling CheckoutsApi->get_checkouts: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::InvoicesApi.new
id = GetAroundOwner::null.new #  | ID of invoice to return


begin
  #Find an invoice by ID
  result = api_instance.get_invoice_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice_by_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::InvoicesApi.new
opts = {
  start_date: GetAroundOwner::null.new, #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
  end_date: GetAroundOwner::null.new, #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find invoices emitted between dates
  result = api_instance.get_invoices(opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoices: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::InvoicesApi.new
rental_id = GetAroundOwner::null.new #  | ID of rental
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find invoices associated to a rental
  result = api_instance.get_invoices_for_rental(rental_id, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoices_for_rental: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::MessagesApi.new
rental_id = GetAroundOwner::null.new #  | ID of rental
opts = {
  body: GetAroundOwner::RentalIdMessagesJsonBody.new # RentalIdMessagesJsonBody | Message to create
}

begin
  #Create Message associated to a rental
  result = api_instance.create_messages(rental_id, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling MessagesApi->create_messages: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::MessagesApi.new
rental_id = GetAroundOwner::null.new #  | ID of rental
id = GetAroundOwner::null.new #  | ID of message to return


begin
  #Find a message by ID associated to a rental
  result = api_instance.get_message_by_id(rental_id, id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling MessagesApi->get_message_by_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::MessagesApi.new
rental_id = GetAroundOwner::null.new #  | ID of rental


begin
  #Find messages associated to a rental
  result = api_instance.get_messages_for_rental(rental_id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling MessagesApi->get_messages_for_rental: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::PayoutsApi.new
id = GetAroundOwner::null.new #  | ID of payout to return


begin
  #Find a payout by ID
  result = api_instance.get_payout_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling PayoutsApi->get_payout_by_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::PayoutsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find payouts paid between dates
  result = api_instance.get_payouts(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling PayoutsApi->get_payouts: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::RentalsApi.new
id = GetAroundOwner::null.new #  | ID of rental to return


begin
  #Find a rental by ID
  result = api_instance.get_rental_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling RentalsApi->get_rental_by_id: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::RentalsApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find rentals booked between dates
  result = api_instance.get_rentals(start_date, end_date, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling RentalsApi->get_rentals: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UnavailabilitiesApi.new
car_id = GetAroundOwner::null.new #  | ID of car
opts = {
  body: GetAroundOwner::CarIdUnavailabilitiesJsonBody.new # CarIdUnavailabilitiesJsonBody | Unavailability to create
}

begin
  #Create Unavailability related to a car between dates
  api_instance.create_unavailabilities(car_id, opts)
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UnavailabilitiesApi->create_unavailabilities: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UnavailabilitiesApi.new
car_id = GetAroundOwner::null.new #  | ID of car


begin
  #Destroy Unavailability related to a car between dates
  api_instance.destroy_unavailability(car_id)
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UnavailabilitiesApi->destroy_unavailability: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UnavailabilitiesApi.new
start_date = GetAroundOwner::null.new #  | Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
end_date = GetAroundOwner::null.new #  | End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
car_id = GetAroundOwner::null.new #  | ID of the car
opts = {
  page: GetAroundOwner::null.new, #  | Page number
  per_page: GetAroundOwner::null.new #  | Page size
}

begin
  #Find Unavailabilities related to a car between dates
  result = api_instance.get_unavailabilities_for_car(start_date, end_date, car_id, opts)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UnavailabilitiesApi->get_unavailabilities_for_car: #{e}"
end
# Setup authorization
GetAroundOwner.configure do |config|
end

api_instance = GetAroundOwner::UsersApi.new
id = GetAroundOwner::null.new #  | ID of user to return


begin
  #Find a user by ID (Users are customers who rent one of your cars)
  result = api_instance.get_user_by_id(id)
  p result
rescue GetAroundOwner::ApiError => e
  puts "Exception when calling UsersApi->get_user_by_id: #{e}"
end
```

## Documentation for API Endpoints

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

| Class                                 | Method                                                                                       | HTTP request                                    | Description                                                       |
| ------------------------------------- | -------------------------------------------------------------------------------------------- | ----------------------------------------------- | ----------------------------------------------------------------- |
| _GetAroundOwner::CarsApi_             | [**get_car_by_id**](docs/CarsApi.md#get_car_by_id)                                           | **GET** /cars/{id}.json                         | Find a car by ID                                                  |
| _GetAroundOwner::CarsApi_             | [**get_cars**](docs/CarsApi.md#get_cars)                                                     | **GET** /cars.json                              | Find all cars                                                     |
| _GetAroundOwner::CheckinsApi_         | [**get_checkin_by_rental_id**](docs/CheckinsApi.md#get_checkin_by_rental_id)                 | **GET** /rentals/{rental_id}/checkin.json       | Find a checkin by rental ID                                       |
| _GetAroundOwner::CheckinsApi_         | [**get_checkins**](docs/CheckinsApi.md#get_checkins)                                         | **GET** /checkins.json                          | List of checkins that occurred between two dates                  |
| _GetAroundOwner::CheckoutsApi_        | [**get_checkout_by_rental_id**](docs/CheckoutsApi.md#get_checkout_by_rental_id)              | **GET** /rentals/{rental_id}/checkout.json      | Find a checkout by rental ID                                      |
| _GetAroundOwner::CheckoutsApi_        | [**get_checkouts**](docs/CheckoutsApi.md#get_checkouts)                                      | **GET** /checkouts.json                         | List of checkouts that occurred between two dates                 |
| _GetAroundOwner::InvoicesApi_         | [**get_invoice_by_id**](docs/InvoicesApi.md#get_invoice_by_id)                               | **GET** /invoices/{id}.json                     | Find an invoice by ID                                             |
| _GetAroundOwner::InvoicesApi_         | [**get_invoices**](docs/InvoicesApi.md#get_invoices)                                         | **GET** /invoices.json                          | Find invoices emitted between dates                               |
| _GetAroundOwner::InvoicesApi_         | [**get_invoices_for_rental**](docs/InvoicesApi.md#get_invoices_for_rental)                   | **GET** /rentals/{rental_id}/invoices.json      | Find invoices associated to a rental                              |
| _GetAroundOwner::MessagesApi_         | [**create_messages**](docs/MessagesApi.md#create_messages)                                   | **POST** /rentals/{rental_id}/messages.json     | Create Message associated to a rental                             |
| _GetAroundOwner::MessagesApi_         | [**get_message_by_id**](docs/MessagesApi.md#get_message_by_id)                               | **GET** /rentals/{rental_id}/messages/{id}.json | Find a message by ID associated to a rental                       |
| _GetAroundOwner::MessagesApi_         | [**get_messages_for_rental**](docs/MessagesApi.md#get_messages_for_rental)                   | **GET** /rentals/{rental_id}/messages.json      | Find messages associated to a rental                              |
| _GetAroundOwner::PayoutsApi_          | [**get_payout_by_id**](docs/PayoutsApi.md#get_payout_by_id)                                  | **GET** /payouts/{id}.json                      | Find a payout by ID                                               |
| _GetAroundOwner::PayoutsApi_          | [**get_payouts**](docs/PayoutsApi.md#get_payouts)                                            | **GET** /payouts.json                           | Find payouts paid between dates                                   |
| _GetAroundOwner::RentalsApi_          | [**get_rental_by_id**](docs/RentalsApi.md#get_rental_by_id)                                  | **GET** /rentals/{id}.json                      | Find a rental by ID                                               |
| _GetAroundOwner::RentalsApi_          | [**get_rentals**](docs/RentalsApi.md#get_rentals)                                            | **GET** /rentals.json                           | Find rentals booked between dates                                 |
| _GetAroundOwner::UnavailabilitiesApi_ | [**create_unavailabilities**](docs/UnavailabilitiesApi.md#create_unavailabilities)           | **POST** /cars/{car_id}/unavailabilities.json   | Create Unavailability related to a car between dates              |
| _GetAroundOwner::UnavailabilitiesApi_ | [**destroy_unavailability**](docs/UnavailabilitiesApi.md#destroy_unavailability)             | **DELETE** /cars/{car_id}/unavailabilities.json | Destroy Unavailability related to a car between dates             |
| _GetAroundOwner::UnavailabilitiesApi_ | [**get_unavailabilities_for_car**](docs/UnavailabilitiesApi.md#get_unavailabilities_for_car) | **GET** /cars/{car_id}/unavailabilities.json    | Find Unavailabilities related to a car between dates              |
| _GetAroundOwner::UsersApi_            | [**get_user_by_id**](docs/UsersApi.md#get_user_by_id)                                        | **GET** /users/{id}.json                        | Find a user by ID (Users are customers who rent one of your cars) |

## Documentation for Models

- [GetAroundOwner::Car](docs/Car.md)
- [GetAroundOwner::CarId](docs/CarId.md)
- [GetAroundOwner::CarIdUnavailabilitiesJsonBody](docs/CarIdUnavailabilitiesJsonBody.md)
- [GetAroundOwner::CarsIndex](docs/CarsIndex.md)
- [GetAroundOwner::Checkin](docs/Checkin.md)
- [GetAroundOwner::CheckinsIndex](docs/CheckinsIndex.md)
- [GetAroundOwner::Checkout](docs/Checkout.md)
- [GetAroundOwner::CheckoutsIndex](docs/CheckoutsIndex.md)
- [GetAroundOwner::EndsAt](docs/EndsAt.md)
- [GetAroundOwner::Invoice](docs/Invoice.md)
- [GetAroundOwner::InvoicesIndex](docs/InvoicesIndex.md)
- [GetAroundOwner::Message](docs/Message.md)
- [GetAroundOwner::MessagesSent](docs/MessagesSent.md)
- [GetAroundOwner::Payout](docs/Payout.md)
- [GetAroundOwner::PayoutsIndex](docs/PayoutsIndex.md)
- [GetAroundOwner::Rental](docs/Rental.md)
- [GetAroundOwner::RentalIdMessagesJsonBody](docs/RentalIdMessagesJsonBody.md)
- [GetAroundOwner::RentalInvoicesIndex](docs/RentalInvoicesIndex.md)
- [GetAroundOwner::RentalMessagesIndex](docs/RentalMessagesIndex.md)
- [GetAroundOwner::RentalsBooked](docs/RentalsBooked.md)
- [GetAroundOwner::RentalsCanceled](docs/RentalsCanceled.md)
- [GetAroundOwner::RentalsCarCheckedIn](docs/RentalsCarCheckedIn.md)
- [GetAroundOwner::RentalsCarCheckedOut](docs/RentalsCarCheckedOut.md)
- [GetAroundOwner::RentalsCarSwitched](docs/RentalsCarSwitched.md)
- [GetAroundOwner::RentalsIndex](docs/RentalsIndex.md)
- [GetAroundOwner::RentalsTimesChanged](docs/RentalsTimesChanged.md)
- [GetAroundOwner::StartsAt](docs/StartsAt.md)
- [GetAroundOwner::UnavailabilitiesCreated](docs/UnavailabilitiesCreated.md)
- [GetAroundOwner::UnavailabilitiesDeleted](docs/UnavailabilitiesDeleted.md)
- [GetAroundOwner::UnavailabilitiesIndex](docs/UnavailabilitiesIndex.md)
- [GetAroundOwner::Unavailability](docs/Unavailability.md)
- [GetAroundOwner::User](docs/User.md)
- [GetAroundOwner::UsersUpdated](docs/UsersUpdated.md)
- [GetAroundOwner::Webhook](docs/Webhook.md)

## Documentation for Authorization

### bearerAuth

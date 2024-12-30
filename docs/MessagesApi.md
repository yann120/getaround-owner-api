# GetAroundOwner::MessagesApi

All URIs are relative to *https://api-eu.getaround.com/owner/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_messages**](MessagesApi.md#create_messages) | **POST** /rentals/{rental_id}/messages.json | Create Message associated to a rental
[**get_message_by_id**](MessagesApi.md#get_message_by_id) | **GET** /rentals/{rental_id}/messages/{id}.json | Find a message by ID associated to a rental
[**get_messages_for_rental**](MessagesApi.md#get_messages_for_rental) | **GET** /rentals/{rental_id}/messages.json | Find messages associated to a rental

# **create_messages**
> Message create_messages(rental_id, opts)

Create Message associated to a rental

Create Message associated to a rental

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
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
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rental_id** | [****](.md)| ID of rental | 
 **body** | [**RentalIdMessagesJsonBody**](RentalIdMessagesJsonBody.md)| Message to create | [optional] 

### Return type

[**Message**](Message.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_message_by_id**
> Message get_message_by_id(rental_id, id)

Find a message by ID associated to a rental

Find a message by ID associated to a rental

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
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
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rental_id** | [****](.md)| ID of rental | 
 **id** | [****](.md)| ID of message to return | 

### Return type

[**Message**](Message.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_messages_for_rental**
> RentalMessagesIndex get_messages_for_rental(rental_id)

Find messages associated to a rental

Find messages associated to a rental

### Example
```ruby
# load the gem
require 'getaround-api'
# setup authorization
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
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rental_id** | [****](.md)| ID of rental | 

### Return type

[**RentalMessagesIndex**](RentalMessagesIndex.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json




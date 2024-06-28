=begin
#Getaround Owner API

## Quick Start  The Owner API uses the JSON format, and must be accessed over a [secure connection](https://en.wikipedia.org/wiki/HTTPS).  Let’s assume that the access token provided by your account manager is “TOKEN”.  Here’s how to get the list of ids of all your invoices from the first week of August with a shell script:  ```bash query=\"end_date=2018-08-08T00%3A00%3A00%2B00%3A00&start_date=2018-08-01T00%3A00%3A00%2B00%3A00\"  curl -i \"https://api-eu.getaround.com/owner/v1/invoices?${query}\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept:application/json\" \\   -H \"Content-Type:application/json\" ```  And here’s how to get the invoice with the id 12345:  ```bash curl -i \"https://api-eu.getaround.com/owner/v1/invoices/12345\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept: application/json\" \\   -H \"Content-Type: application/json\"\" ```  See the [endpoints section](#tag/Invoices) of this guide for details about the response format.  Dates in request params should follow the ISO 8601 standard.   # Authentication  All requests must be authenticated with a [bearer token header](https://tools.ietf.org/html/rfc6750#section-2.1). You token will be sent to you by your account manager.  Unauthenticated requests will return a 401 status.   # Pagination  The page number and the number of items per page can be set with the “page” and “per_page” params.  For example, this request will return the second page of invoices, and 50 invoices per page:  `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50`  Both of these params are optional. The default page size is 30 items.  The Getaround Owner API follows the [RFC 8288 convention](https://datatracker.ietf.org/doc/html/rfc8288) of using the `Link` header to provide the `next` page URL. Please don't build the pagination URLs yourself. The `next` page will be missing when you are requesting the last available page.  Here's an example response header from requesting the second page of invoices `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50` ``` Link: <https://api-eu.getaround.com/owner/v1/invoices?page=3&per_page=50>; rel=\"next\" ```   # Throttling policy and Date range limitation  We have throttling policy that prevents you to perform more than 100 requests per min from the same IP.  Also, there is a limitation on the size of the range of dates given in params in some requests.  All requests that need start_date and end_date, do not accept a range bigger than 30 days.   # Webhooks  Getaround can send webhook events that notify your application when certain events happen on your account. This is especially useful to follow the lifecycle of rentals, tracking for example bookings or cancellations.  ### Setup  To set up an endpoint, you need to define a route on your server for receiving events, and then <a href=\"mailto:owner-api@getaround.com\">ask Getaround</a> to add this URL to your account.  To acknowledge receipt of a event, your endpoint must:  - Return a `2xx` HTTP status code. - Be a secure `https` endpoint with a valid SSL certificate.  ### Testing  Once Getaround has set up the endpoint, and it is properly configured as described above, a test `ping` event can be sent by clicking the button below:  <form action=\"/docs/api/owner/fire_ping_webhook\" method=\"post\"><input type=\"submit\" value=\"Send Ping Event\"></form>  You should receive the following JSON payload:  ```json {   \"data\": {     \"ping\": \"pong\"   },   \"type\": \"ping\",   \"occurred_at\": \"2019-04-18T08:30:05Z\" } ```  ### Retries  Webhook deliveries will be attempted for up to three days with an exponential back off. After that point the delivery will be abandoned.  ### Verifying Signatures  Getaround will also provide you with a secret token, which is used to create a hash signature with each payload.  This hash signature is passed along with each request in the headers as `X-Drivy-Signature`. Suppose you have a basic server listening to webhooks that looks like this:  ```ruby require 'sinatra' require 'json'  post '/payload' do   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end ```  The goal is to compute a hash using your secret token, and ensure that the hash from Getaround matches. Getaround uses an HMAC hexdigest to compute the hash, so you could change your server to look a little like this:  ```ruby post '/payload' do   request.body.rewind   payload_body = request.body.read   verify_signature(payload_body)   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end  def verify_signature(payload_body)   signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)   return halt 500, \"Signatures didn't match!\" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_DRIVY_SIGNATURE']) end ```  Obviously, your language and server implementations may differ from this code. There are a couple of important things to point out, however:  No matter which implementation you use, the hash signature starts with `sha1=`, using the key of your secret token and your payload body.  Using a plain `==` operator is not advised. A method like secure_compare performs a \"constant time\" string comparison, which renders it safe from certain timing attacks against regular equality operators.  ### Best Practices  - **Acknowledge events immediately**. If your webhook script performs complex logic, or makes network calls, it’s possible that the script would time out before Getaround sees its complete execution. Ideally, your webhook handler code (acknowledging receipt of an event by returning a `2xx` status code) is separate of any other logic you do for that event. - **Handle duplicate events**. Webhook endpoints might occasionally receive the same event more than once. We advise you to guard against duplicated event receipts by making your event processing idempotent. One way of doing this is logging the events you’ve processed, and then not processing already-logged events. - **Do not expect events in order**. Getaround does not guarantee delivery of events in the order in which they are generated. Your endpoint should therefore handle this accordingly. We do provide an `occurred_at` timestamp for each event, though, to help reconcile ordering. 

The version of the OpenAPI document: 1.0.0
Contact: owner-api@getaround.com
Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

require 'cgi'

module GetAroundOwner
  class InvoicesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Find an invoice by ID
    # Find an invoice by ID
    # @param id [String] ID of invoice to return
    # @param [Hash] opts the optional parameters
    # @return [GetaroundInvoice]
    def get_invoice_by_id(id, opts = {})
      data, _status_code, _headers = get_invoice_by_id_with_http_info(id, opts)
      data
    end

    # Find an invoice by ID
    # Find an invoice by ID
    # @param id [String] ID of invoice to return
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetaroundInvoice, Integer, Hash)>] GetaroundInvoice data, response status code and response headers
    def get_invoice_by_id_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice_by_id ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_invoice_by_id"
      end
      # resource path
      local_var_path = '/invoices/{id}.json'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetaroundInvoice'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"InvoicesApi.get_invoice_by_id",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoice_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find invoices emitted between dates
    # Find invoices emitted between dates
    # @param [Hash] opts the optional parameters
    # @option opts [Time] :start_date Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
    # @option opts [Time] :end_date End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
    # @option opts [String] :page Page number
    # @option opts [String] :per_page Page size (default to '30')
    # @return [Array<GetaroundInvoicesIndexInner>]
    def get_invoices(opts = {})
      data, _status_code, _headers = get_invoices_with_http_info(opts)
      data
    end

    # Find invoices emitted between dates
    # Find invoices emitted between dates
    # @param [Hash] opts the optional parameters
    # @option opts [Time] :start_date Start date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
    # @option opts [Time] :end_date End date and time in [ISO8601 format](https://www.iso.org/iso-8601-date-and-time-format.html)
    # @option opts [String] :page Page number
    # @option opts [String] :per_page Page size (default to '30')
    # @return [Array<(Array<GetaroundInvoicesIndexInner>, Integer, Hash)>] Array<GetaroundInvoicesIndexInner> data, response status code and response headers
    def get_invoices_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoices ...'
      end
      # resource path
      local_var_path = '/invoices.json'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'per_page'] = opts[:'per_page'] if !opts[:'per_page'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<GetaroundInvoicesIndexInner>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"InvoicesApi.get_invoices",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoices\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find invoices associated to a rental
    # Find invoices associated to a rental
    # @param rental_id [String] ID of rental
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page Page number
    # @option opts [String] :per_page Page size (default to '30')
    # @return [Array<GetaroundRentalInvoicesIndexInner>]
    def get_invoices_for_rental(rental_id, opts = {})
      data, _status_code, _headers = get_invoices_for_rental_with_http_info(rental_id, opts)
      data
    end

    # Find invoices associated to a rental
    # Find invoices associated to a rental
    # @param rental_id [String] ID of rental
    # @param [Hash] opts the optional parameters
    # @option opts [String] :page Page number
    # @option opts [String] :per_page Page size (default to '30')
    # @return [Array<(Array<GetaroundRentalInvoicesIndexInner>, Integer, Hash)>] Array<GetaroundRentalInvoicesIndexInner> data, response status code and response headers
    def get_invoices_for_rental_with_http_info(rental_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoices_for_rental ...'
      end
      # verify the required parameter 'rental_id' is set
      if @api_client.config.client_side_validation && rental_id.nil?
        fail ArgumentError, "Missing the required parameter 'rental_id' when calling InvoicesApi.get_invoices_for_rental"
      end
      # resource path
      local_var_path = '/rentals/{rental_id}/invoices.json'.sub('{' + 'rental_id' + '}', CGI.escape(rental_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'page'] = opts[:'page'] if !opts[:'page'].nil?
      query_params[:'per_page'] = opts[:'per_page'] if !opts[:'per_page'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Array<GetaroundRentalInvoicesIndexInner>'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['bearerAuth']

      new_options = opts.merge(
        :operation => :"InvoicesApi.get_invoices_for_rental",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoicesApi#get_invoices_for_rental\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end

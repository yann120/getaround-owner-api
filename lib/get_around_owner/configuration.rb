=begin
#Getaround Owner API

## Quick Start  The Owner API uses the JSON format, and must be accessed over a [secure connection](https://en.wikipedia.org/wiki/HTTPS).  Let’s assume that the access token provided by your account manager is “TOKEN”.  Here’s how to get the list of ids of all your invoices from the first week of August with a shell script:  ```bash query=\"end_date=2018-08-08T00%3A00%3A00%2B00%3A00&start_date=2018-08-01T00%3A00%3A00%2B00%3A00\"  curl -i \"https://api-eu.getaround.com/owner/v1/invoices?${query}\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept:application/json\" \\   -H \"Content-Type:application/json\" ```  And here’s how to get the invoice with the id 12345:  ```bash curl -i \"https://api-eu.getaround.com/owner/v1/invoices/12345\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept: application/json\" \\   -H \"Content-Type: application/json\"\" ```  See the [endpoints section](#tag/Invoices) of this guide for details about the response format.  Dates in request params should follow the ISO 8601 standard.   # Authentication  All requests must be authenticated with a [bearer token header](https://tools.ietf.org/html/rfc6750#section-2.1). You token will be sent to you by your account manager.  Unauthenticated requests will return a 401 status.   # Pagination  The page number and the number of items per page can be set with the “page” and “per_page” params.  For example, this request will return the second page of invoices, and 50 invoices per page:  `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50`  Both of these params are optional. The default page size is 30 items.  The Getaround Owner API follows the [RFC 8288 convention](https://datatracker.ietf.org/doc/html/rfc8288) of using the `Link` header to provide the `next` page URL. Please don't build the pagination URLs yourself. The `next` page will be missing when you are requesting the last available page.  Here's an example response header from requesting the second page of invoices `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50` ``` Link: <https://api-eu.getaround.com/owner/v1/invoices?page=3&per_page=50>; rel=\"next\" ```   # Throttling policy and Date range limitation  We have throttling policy that prevents you to perform more than 100 requests per min from the same IP.  Also, there is a limitation on the size of the range of dates given in params in some requests.  All requests that need start_date and end_date, do not accept a range bigger than 30 days.   # Webhooks  Getaround can send webhook events that notify your application when certain events happen on your account. This is especially useful to follow the lifecycle of rentals, tracking for example bookings or cancellations.  ### Setup  To set up an endpoint, you need to define a route on your server for receiving events, and then <a href=\"mailto:owner-api@getaround.com\">ask Getaround</a> to add this URL to your account.  To acknowledge receipt of a event, your endpoint must:  - Return a `2xx` HTTP status code. - Be a secure `https` endpoint with a valid SSL certificate.  ### Testing  Once Getaround has set up the endpoint, and it is properly configured as described above, a test `ping` event can be sent by clicking the button below:  <form action=\"/docs/api/owner/fire_ping_webhook\" method=\"post\"><input type=\"submit\" value=\"Send Ping Event\"></form>  You should receive the following JSON payload:  ```json {   \"data\": {     \"ping\": \"pong\"   },   \"type\": \"ping\",   \"occurred_at\": \"2019-04-18T08:30:05Z\" } ```  ### Retries  Webhook deliveries will be attempted for up to three days with an exponential back off. After that point the delivery will be abandoned.  ### Verifying Signatures  Getaround will also provide you with a secret token, which is used to create a hash signature with each payload.  This hash signature is passed along with each request in the headers as `X-Drivy-Signature`. Suppose you have a basic server listening to webhooks that looks like this:  ```ruby require 'sinatra' require 'json'  post '/payload' do   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end ```  The goal is to compute a hash using your secret token, and ensure that the hash from Getaround matches. Getaround uses an HMAC hexdigest to compute the hash, so you could change your server to look a little like this:  ```ruby post '/payload' do   request.body.rewind   payload_body = request.body.read   verify_signature(payload_body)   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end  def verify_signature(payload_body)   signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)   return halt 500, \"Signatures didn't match!\" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_DRIVY_SIGNATURE']) end ```  Obviously, your language and server implementations may differ from this code. There are a couple of important things to point out, however:  No matter which implementation you use, the hash signature starts with `sha1=`, using the key of your secret token and your payload body.  Using a plain `==` operator is not advised. A method like secure_compare performs a \"constant time\" string comparison, which renders it safe from certain timing attacks against regular equality operators.  ### Best Practices  - **Acknowledge events immediately**. If your webhook script performs complex logic, or makes network calls, it’s possible that the script would time out before Getaround sees its complete execution. Ideally, your webhook handler code (acknowledging receipt of an event by returning a `2xx` status code) is separate of any other logic you do for that event. - **Handle duplicate events**. Webhook endpoints might occasionally receive the same event more than once. We advise you to guard against duplicated event receipts by making your event processing idempotent. One way of doing this is logging the events you’ve processed, and then not processing already-logged events. - **Do not expect events in order**. Getaround does not guarantee delivery of events in the order in which they are generated. Your endpoint should therefore handle this accordingly. We do provide an `occurred_at` timestamp for each event, though, to help reconcile ordering. 

The version of the OpenAPI document: 1.0.0
Contact: owner-api@getaround.com
Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

module GetAroundOwner
  class Configuration
    # Defines url scheme
    attr_accessor :scheme

    # Defines url host
    attr_accessor :host

    # Defines url base path
    attr_accessor :base_path

    # Define server configuration index
    attr_accessor :server_index

    # Define server operation configuration index
    attr_accessor :server_operation_index

    # Default server variables
    attr_accessor :server_variables

    # Default server operation variables
    attr_accessor :server_operation_variables

    # Defines API keys used with API Key authentications.
    #
    # @return [Hash] key: parameter name, value: parameter value (API key)
    #
    # @example parameter name is "api_key", API key is "xxx" (e.g. "api_key=xxx" in query string)
    #   config.api_key['api_key'] = 'xxx'
    attr_accessor :api_key

    # Defines API key prefixes used with API Key authentications.
    #
    # @return [Hash] key: parameter name, value: API key prefix
    #
    # @example parameter name is "Authorization", API key prefix is "Token" (e.g. "Authorization: Token xxx" in headers)
    #   config.api_key_prefix['api_key'] = 'Token'
    attr_accessor :api_key_prefix

    # Defines the username used with HTTP basic authentication.
    #
    # @return [String]
    attr_accessor :username

    # Defines the password used with HTTP basic authentication.
    #
    # @return [String]
    attr_accessor :password

    # Defines the access token (Bearer) used with OAuth2.
    attr_accessor :access_token

    # Defines a Proc used to fetch or refresh access tokens (Bearer) used with OAuth2.
    # Overrides the access_token if set
    # @return [Proc]
    attr_accessor :access_token_getter

    # Set this to return data as binary instead of downloading a temp file. When enabled (set to true)
    # HTTP responses with return type `File` will be returned as a stream of binary data.
    # Default to false.
    attr_accessor :return_binary_data

    # Set this to enable/disable debugging. When enabled (set to true), HTTP request/response
    # details will be logged with `logger.debug` (see the `logger` attribute).
    # Default to false.
    #
    # @return [true, false]
    attr_accessor :debugging

    # Defines the logger used for debugging.
    # Default to `Rails.logger` (when in Rails) or logging to STDOUT.
    #
    # @return [#debug]
    attr_accessor :logger

    # Defines the temporary folder to store downloaded files
    # (for API endpoints that have file response).
    # Default to use `Tempfile`.
    #
    # @return [String]
    attr_accessor :temp_folder_path

    # The time limit for HTTP request in seconds.
    # Default to 0 (never times out).
    attr_accessor :timeout

    # Set this to false to skip client side validation in the operation.
    # Default to true.
    # @return [true, false]
    attr_accessor :client_side_validation

    ### TLS/SSL setting
    # Set this to false to skip verifying SSL certificate when calling API from https server.
    # Default to true.
    #
    # @note Do NOT set it to false in production code, otherwise you would face multiple types of cryptographic attacks.
    #
    # @return [true, false]
    attr_accessor :verify_ssl

    ### TLS/SSL setting
    # Set this to false to skip verifying SSL host name
    # Default to true.
    #
    # @note Do NOT set it to false in production code, otherwise you would face multiple types of cryptographic attacks.
    #
    # @return [true, false]
    attr_accessor :verify_ssl_host

    ### TLS/SSL setting
    # Set this to customize the certificate file to verify the peer.
    #
    # @return [String] the path to the certificate file
    #
    # @see The `cainfo` option of Typhoeus, `--cert` option of libcurl. Related source code:
    # https://github.com/typhoeus/typhoeus/blob/master/lib/typhoeus/easy_factory.rb#L145
    attr_accessor :ssl_ca_cert

    ### TLS/SSL setting
    # Client certificate file (for client certificate)
    attr_accessor :cert_file

    ### TLS/SSL setting
    # Client private key file (for client certificate)
    attr_accessor :key_file

    # Set this to customize parameters encoding of array parameter with multi collectionFormat.
    # Default to nil.
    #
    # @see The params_encoding option of Ethon. Related source code:
    # https://github.com/typhoeus/ethon/blob/master/lib/ethon/easy/queryable.rb#L96
    attr_accessor :params_encoding


    attr_accessor :inject_format

    attr_accessor :force_ending_format

    def initialize
      @scheme = 'https'
      @host = 'api-eu.getaround.com'
      @base_path = '/owner/v1'
      @server_index = nil
      @server_operation_index = {}
      @server_variables = {}
      @server_operation_variables = {}
      @api_key = {}
      @api_key_prefix = {}
      @client_side_validation = true
      @verify_ssl = true
      @verify_ssl_host = true
      @cert_file = nil
      @key_file = nil
      @timeout = 0
      @params_encoding = nil
      @debugging = false
      @inject_format = false
      @force_ending_format = false
      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDOUT)

      yield(self) if block_given?
    end

    # The default Configuration object.
    def self.default
      @@default ||= Configuration.new
    end

    def configure
      yield(self) if block_given?
    end

    def scheme=(scheme)
      # remove :// from scheme
      @scheme = scheme.sub(/:\/\//, '')
    end

    def host=(host)
      # remove http(s):// and anything after a slash
      @host = host.sub(/https?:\/\//, '').split('/').first
    end

    def base_path=(base_path)
      # Add leading and trailing slashes to base_path
      @base_path = "/#{base_path}".gsub(/\/+/, '/')
      @base_path = '' if @base_path == '/'
    end

    # Returns base URL for specified operation based on server settings
    def base_url(operation = nil)
      if operation_server_settings.key?(operation) then
        index = server_operation_index.fetch(operation, server_index)
        server_url(index.nil? ? 0 : index, server_operation_variables.fetch(operation, server_variables), operation_server_settings[operation])
      else
        server_index.nil? ? "#{scheme}://#{[host, base_path].join('/').gsub(/\/+/, '/')}".sub(/\/+\z/, '') : server_url(server_index, server_variables, nil)
      end
    end

    # Gets API key (with prefix if set).
    # @param [String] param_name the parameter name of API key auth
    def api_key_with_prefix(param_name, param_alias = nil)
      key = @api_key[param_name]
      key = @api_key.fetch(param_alias, key) unless param_alias.nil?
      if @api_key_prefix[param_name]
        "#{@api_key_prefix[param_name]} #{key}"
      else
        key
      end
    end

    # Gets access_token using access_token_getter or uses the static access_token
    def access_token_with_refresh
      return access_token if access_token_getter.nil?
      access_token_getter.call
    end

    # Gets Basic Auth token string
    def basic_auth_token
      'Basic ' + ["#{username}:#{password}"].pack('m').delete("\r\n")
    end

    # Returns Auth Settings hash for api client.
    def auth_settings
      {
        'bearerAuth' =>
          {
            type: 'bearer',
            in: 'header',
            key: 'Authorization',
            value: "Bearer #{access_token_with_refresh}"
          },
      }
    end

    # Returns an array of Server setting
    def server_settings
      [
        {
          url: "https://api-eu.getaround.com/owner/v1",
          description: "Production server",
        }
      ]
    end

    def operation_server_settings
      {
      }
    end

    # Returns URL based on server settings
    #
    # @param index array index of the server settings
    # @param variables hash of variable and the corresponding value
    def server_url(index, variables = {}, servers = nil)
      servers = server_settings if servers == nil

      # check array index out of bound
      if (index.nil? || index < 0 || index >= servers.size)
        fail ArgumentError, "Invalid index #{index} when selecting the server. Must not be nil and must be less than #{servers.size}"
      end

      server = servers[index]
      url = server[:url]

      return url unless server.key? :variables

      # go through variable and assign a value
      server[:variables].each do |name, variable|
        if variables.key?(name)
          if (!server[:variables][name].key?(:enum_values) || server[:variables][name][:enum_values].include?(variables[name]))
            url.gsub! "{" + name.to_s + "}", variables[name]
          else
            fail ArgumentError, "The variable `#{name}` in the server URL has invalid value #{variables[name]}. Must be #{server[:variables][name][:enum_values]}."
          end
        else
          # use default value
          url.gsub! "{" + name.to_s + "}", server[:variables][name][:default_value]
        end
      end

      url
    end


  end
end

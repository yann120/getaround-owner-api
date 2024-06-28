=begin
#Getaround Owner API

## Quick Start  The Owner API uses the JSON format, and must be accessed over a [secure connection](https://en.wikipedia.org/wiki/HTTPS).  Let’s assume that the access token provided by your account manager is “TOKEN”.  Here’s how to get the list of ids of all your invoices from the first week of August with a shell script:  ```bash query=\"end_date=2018-08-08T00%3A00%3A00%2B00%3A00&start_date=2018-08-01T00%3A00%3A00%2B00%3A00\"  curl -i \"https://api-eu.getaround.com/owner/v1/invoices?${query}\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept:application/json\" \\   -H \"Content-Type:application/json\" ```  And here’s how to get the invoice with the id 12345:  ```bash curl -i \"https://api-eu.getaround.com/owner/v1/invoices/12345\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept: application/json\" \\   -H \"Content-Type: application/json\"\" ```  See the [endpoints section](#tag/Invoices) of this guide for details about the response format.  Dates in request params should follow the ISO 8601 standard.   # Authentication  All requests must be authenticated with a [bearer token header](https://tools.ietf.org/html/rfc6750#section-2.1). You token will be sent to you by your account manager.  Unauthenticated requests will return a 401 status.   # Pagination  The page number and the number of items per page can be set with the “page” and “per_page” params.  For example, this request will return the second page of invoices, and 50 invoices per page:  `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50`  Both of these params are optional. The default page size is 30 items.  The Getaround Owner API follows the [RFC 8288 convention](https://datatracker.ietf.org/doc/html/rfc8288) of using the `Link` header to provide the `next` page URL. Please don't build the pagination URLs yourself. The `next` page will be missing when you are requesting the last available page.  Here's an example response header from requesting the second page of invoices `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50` ``` Link: <https://api-eu.getaround.com/owner/v1/invoices?page=3&per_page=50>; rel=\"next\" ```   # Throttling policy and Date range limitation  We have throttling policy that prevents you to perform more than 100 requests per min from the same IP.  Also, there is a limitation on the size of the range of dates given in params in some requests.  All requests that need start_date and end_date, do not accept a range bigger than 30 days.   # Webhooks  Getaround can send webhook events that notify your application when certain events happen on your account. This is especially useful to follow the lifecycle of rentals, tracking for example bookings or cancellations.  ### Setup  To set up an endpoint, you need to define a route on your server for receiving events, and then <a href=\"mailto:owner-api@getaround.com\">ask Getaround</a> to add this URL to your account.  To acknowledge receipt of a event, your endpoint must:  - Return a `2xx` HTTP status code. - Be a secure `https` endpoint with a valid SSL certificate.  ### Testing  Once Getaround has set up the endpoint, and it is properly configured as described above, a test `ping` event can be sent by clicking the button below:  <form action=\"/docs/api/owner/fire_ping_webhook\" method=\"post\"><input type=\"submit\" value=\"Send Ping Event\"></form>  You should receive the following JSON payload:  ```json {   \"data\": {     \"ping\": \"pong\"   },   \"type\": \"ping\",   \"occurred_at\": \"2019-04-18T08:30:05Z\" } ```  ### Retries  Webhook deliveries will be attempted for up to three days with an exponential back off. After that point the delivery will be abandoned.  ### Verifying Signatures  Getaround will also provide you with a secret token, which is used to create a hash signature with each payload.  This hash signature is passed along with each request in the headers as `X-Drivy-Signature`. Suppose you have a basic server listening to webhooks that looks like this:  ```ruby require 'sinatra' require 'json'  post '/payload' do   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end ```  The goal is to compute a hash using your secret token, and ensure that the hash from Getaround matches. Getaround uses an HMAC hexdigest to compute the hash, so you could change your server to look a little like this:  ```ruby post '/payload' do   request.body.rewind   payload_body = request.body.read   verify_signature(payload_body)   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end  def verify_signature(payload_body)   signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)   return halt 500, \"Signatures didn't match!\" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_DRIVY_SIGNATURE']) end ```  Obviously, your language and server implementations may differ from this code. There are a couple of important things to point out, however:  No matter which implementation you use, the hash signature starts with `sha1=`, using the key of your secret token and your payload body.  Using a plain `==` operator is not advised. A method like secure_compare performs a \"constant time\" string comparison, which renders it safe from certain timing attacks against regular equality operators.  ### Best Practices  - **Acknowledge events immediately**. If your webhook script performs complex logic, or makes network calls, it’s possible that the script would time out before Getaround sees its complete execution. Ideally, your webhook handler code (acknowledging receipt of an event by returning a `2xx` status code) is separate of any other logic you do for that event. - **Handle duplicate events**. Webhook endpoints might occasionally receive the same event more than once. We advise you to guard against duplicated event receipts by making your event processing idempotent. One way of doing this is logging the events you’ve processed, and then not processing already-logged events. - **Do not expect events in order**. Getaround does not guarantee delivery of events in the order in which they are generated. Your endpoint should therefore handle this accordingly. We do provide an `occurred_at` timestamp for each event, though, to help reconcile ordering. 

The version of the OpenAPI document: 1.0.0
Contact: owner-api@getaround.com
Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

require 'date'
require 'time'

module GetAroundOwner
  # A Rental.
  class GetaroundRental
    # Rental's id
    attr_accessor :id

    # Vehicle's id
    attr_accessor :car_id

    # User id of the rental's driver
    attr_accessor :user_id

    # Rental's started time in ISO8601 format
    attr_accessor :starts_at

    # Rental's ended time in ISO8601 format
    attr_accessor :ends_at

    # Rental's booked time in ISO8601 format
    attr_accessor :booked_at

    # Price set by the owner (in cents 0.01€)
    attr_accessor :price

    # Insurance amount collected (in cents 0.01€)
    attr_accessor :insurance_fee

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'car_id' => :'car_id',
        :'user_id' => :'user_id',
        :'starts_at' => :'starts_at',
        :'ends_at' => :'ends_at',
        :'booked_at' => :'booked_at',
        :'price' => :'price',
        :'insurance_fee' => :'insurance_fee'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'Integer',
        :'car_id' => :'Integer',
        :'user_id' => :'Integer',
        :'starts_at' => :'Time',
        :'ends_at' => :'Time',
        :'booked_at' => :'Time',
        :'price' => :'Integer',
        :'insurance_fee' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `GetAroundOwner::GetaroundRental` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `GetAroundOwner::GetaroundRental`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      else
        self.id = nil
      end

      if attributes.key?(:'car_id')
        self.car_id = attributes[:'car_id']
      else
        self.car_id = nil
      end

      if attributes.key?(:'user_id')
        self.user_id = attributes[:'user_id']
      else
        self.user_id = nil
      end

      if attributes.key?(:'starts_at')
        self.starts_at = attributes[:'starts_at']
      else
        self.starts_at = nil
      end

      if attributes.key?(:'ends_at')
        self.ends_at = attributes[:'ends_at']
      else
        self.ends_at = nil
      end

      if attributes.key?(:'booked_at')
        self.booked_at = attributes[:'booked_at']
      else
        self.booked_at = nil
      end

      if attributes.key?(:'price')
        self.price = attributes[:'price']
      else
        self.price = nil
      end

      if attributes.key?(:'insurance_fee')
        self.insurance_fee = attributes[:'insurance_fee']
      else
        self.insurance_fee = nil
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @car_id.nil?
        invalid_properties.push('invalid value for "car_id", car_id cannot be nil.')
      end

      if @car_id < 1
        invalid_properties.push('invalid value for "car_id", must be greater than or equal to 1.')
      end

      if @user_id.nil?
        invalid_properties.push('invalid value for "user_id", user_id cannot be nil.')
      end

      if @user_id < 1
        invalid_properties.push('invalid value for "user_id", must be greater than or equal to 1.')
      end

      if @starts_at.nil?
        invalid_properties.push('invalid value for "starts_at", starts_at cannot be nil.')
      end

      if @ends_at.nil?
        invalid_properties.push('invalid value for "ends_at", ends_at cannot be nil.')
      end

      if @booked_at.nil?
        invalid_properties.push('invalid value for "booked_at", booked_at cannot be nil.')
      end

      if @price.nil?
        invalid_properties.push('invalid value for "price", price cannot be nil.')
      end

      if @insurance_fee.nil?
        invalid_properties.push('invalid value for "insurance_fee", insurance_fee cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @id.nil?
      return false if @car_id.nil?
      return false if @car_id < 1
      return false if @user_id.nil?
      return false if @user_id < 1
      return false if @starts_at.nil?
      return false if @ends_at.nil?
      return false if @booked_at.nil?
      return false if @price.nil?
      return false if @insurance_fee.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] car_id Value to be assigned
    def car_id=(car_id)
      if car_id.nil?
        fail ArgumentError, 'car_id cannot be nil'
      end

      if car_id < 1
        fail ArgumentError, 'invalid value for "car_id", must be greater than or equal to 1.'
      end

      @car_id = car_id
    end

    # Custom attribute writer method with validation
    # @param [Object] user_id Value to be assigned
    def user_id=(user_id)
      if user_id.nil?
        fail ArgumentError, 'user_id cannot be nil'
      end

      if user_id < 1
        fail ArgumentError, 'invalid value for "user_id", must be greater than or equal to 1.'
      end

      @user_id = user_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          car_id == o.car_id &&
          user_id == o.user_id &&
          starts_at == o.starts_at &&
          ends_at == o.ends_at &&
          booked_at == o.booked_at &&
          price == o.price &&
          insurance_fee == o.insurance_fee
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, car_id, user_id, starts_at, ends_at, booked_at, price, insurance_fee].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = GetAroundOwner.const_get(type)
        klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end

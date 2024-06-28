=begin
#Getaround Owner API

## Quick Start  The Owner API uses the JSON format, and must be accessed over a [secure connection](https://en.wikipedia.org/wiki/HTTPS).  Let’s assume that the access token provided by your account manager is “TOKEN”.  Here’s how to get the list of ids of all your invoices from the first week of August with a shell script:  ```bash query=\"end_date=2018-08-08T00%3A00%3A00%2B00%3A00&start_date=2018-08-01T00%3A00%3A00%2B00%3A00\"  curl -i \"https://api-eu.getaround.com/owner/v1/invoices?${query}\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept:application/json\" \\   -H \"Content-Type:application/json\" ```  And here’s how to get the invoice with the id 12345:  ```bash curl -i \"https://api-eu.getaround.com/owner/v1/invoices/12345\" \\   -H \"Authorization: Bearer TOKEN\" \\   -H \"Accept: application/json\" \\   -H \"Content-Type: application/json\"\" ```  See the [endpoints section](#tag/Invoices) of this guide for details about the response format.  Dates in request params should follow the ISO 8601 standard.   # Authentication  All requests must be authenticated with a [bearer token header](https://tools.ietf.org/html/rfc6750#section-2.1). You token will be sent to you by your account manager.  Unauthenticated requests will return a 401 status.   # Pagination  The page number and the number of items per page can be set with the “page” and “per_page” params.  For example, this request will return the second page of invoices, and 50 invoices per page:  `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50`  Both of these params are optional. The default page size is 30 items.  The Getaround Owner API follows the [RFC 8288 convention](https://datatracker.ietf.org/doc/html/rfc8288) of using the `Link` header to provide the `next` page URL. Please don't build the pagination URLs yourself. The `next` page will be missing when you are requesting the last available page.  Here's an example response header from requesting the second page of invoices `https://api-eu.getaround.com/owner/v1/invoices?page=2&per_page=50` ``` Link: <https://api-eu.getaround.com/owner/v1/invoices?page=3&per_page=50>; rel=\"next\" ```   # Throttling policy and Date range limitation  We have throttling policy that prevents you to perform more than 100 requests per min from the same IP.  Also, there is a limitation on the size of the range of dates given in params in some requests.  All requests that need start_date and end_date, do not accept a range bigger than 30 days.   # Webhooks  Getaround can send webhook events that notify your application when certain events happen on your account. This is especially useful to follow the lifecycle of rentals, tracking for example bookings or cancellations.  ### Setup  To set up an endpoint, you need to define a route on your server for receiving events, and then <a href=\"mailto:owner-api@getaround.com\">ask Getaround</a> to add this URL to your account.  To acknowledge receipt of a event, your endpoint must:  - Return a `2xx` HTTP status code. - Be a secure `https` endpoint with a valid SSL certificate.  ### Testing  Once Getaround has set up the endpoint, and it is properly configured as described above, a test `ping` event can be sent by clicking the button below:  <form action=\"/docs/api/owner/fire_ping_webhook\" method=\"post\"><input type=\"submit\" value=\"Send Ping Event\"></form>  You should receive the following JSON payload:  ```json {   \"data\": {     \"ping\": \"pong\"   },   \"type\": \"ping\",   \"occurred_at\": \"2019-04-18T08:30:05Z\" } ```  ### Retries  Webhook deliveries will be attempted for up to three days with an exponential back off. After that point the delivery will be abandoned.  ### Verifying Signatures  Getaround will also provide you with a secret token, which is used to create a hash signature with each payload.  This hash signature is passed along with each request in the headers as `X-Drivy-Signature`. Suppose you have a basic server listening to webhooks that looks like this:  ```ruby require 'sinatra' require 'json'  post '/payload' do   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end ```  The goal is to compute a hash using your secret token, and ensure that the hash from Getaround matches. Getaround uses an HMAC hexdigest to compute the hash, so you could change your server to look a little like this:  ```ruby post '/payload' do   request.body.rewind   payload_body = request.body.read   verify_signature(payload_body)   push = JSON.parse(params[:payload])   \"I got some JSON: \#{push.inspect}\" end  def verify_signature(payload_body)   signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)   return halt 500, \"Signatures didn't match!\" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_DRIVY_SIGNATURE']) end ```  Obviously, your language and server implementations may differ from this code. There are a couple of important things to point out, however:  No matter which implementation you use, the hash signature starts with `sha1=`, using the key of your secret token and your payload body.  Using a plain `==` operator is not advised. A method like secure_compare performs a \"constant time\" string comparison, which renders it safe from certain timing attacks against regular equality operators.  ### Best Practices  - **Acknowledge events immediately**. If your webhook script performs complex logic, or makes network calls, it’s possible that the script would time out before Getaround sees its complete execution. Ideally, your webhook handler code (acknowledging receipt of an event by returning a `2xx` status code) is separate of any other logic you do for that event. - **Handle duplicate events**. Webhook endpoints might occasionally receive the same event more than once. We advise you to guard against duplicated event receipts by making your event processing idempotent. One way of doing this is logging the events you’ve processed, and then not processing already-logged events. - **Do not expect events in order**. Getaround does not guarantee delivery of events in the order in which they are generated. Your endpoint should therefore handle this accordingly. We do provide an `occurred_at` timestamp for each event, though, to help reconcile ordering. 

The version of the OpenAPI document: 1.0.0
Contact: owner-api@getaround.com
Generated by: https://openapi-generator.tech
Generator version: 7.6.0

=end

# load the gem
require 'get_around_owner'

# The following  was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end

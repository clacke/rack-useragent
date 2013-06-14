require 'user_agent'
require 'ostruct'

module Rack::UserAgent
  class Filter
    def initialize(app, config = [], options = {})
      @app = app
      @browsers = config
      @path = options[:path]
    end

    def call(env)
      browser = UserAgent.parse(env["HTTP_USER_AGENT"]) if env["HTTP_USER_AGENT"]
      if unsupported?(browser)
        @app.call(fallback_env(env))
      else
        @app.call(env)
      end
    end

    private

    def unsupported?(browser)
      browser && @browsers.any? do |hash_or_proc|
        if hash_or_proc.respond_to? :call
          hash_or_proc.call(browser)
        else
          browser < OpenStruct.new(hash_or_proc)
        end
      end
    end

    def fallback_env env
      env.merge(
        "rack-useragent.fallback" => true,
        "REQUEST_METHOD" => "GET",
        "SCRIPT_NAME" => "",
        "PATH_INFO" => @path,
        "QUERY_STRING" => ""        
      )
    end
  end
end

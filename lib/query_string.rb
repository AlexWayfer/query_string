require 'query_string/version'
require 'cgi'

# Module with class methods for convertation
module QueryString
  class << self
    def build(value, key = nil)
      case value
      when Hash
        value.map { |k, v| build(v, append_key(key, k)) }.join('&')
      when Array
        value.map { |v| build(v, "#{key}[]") }.join('&')
      when nil
        ''
      else
        "#{key}=#{CGI.escape(value.to_s)}"
      end
    end

    private

    def append_key(root_key, key)
      root_key.nil? ? key : "#{root_key}[#{key}]"
    end
  end
end

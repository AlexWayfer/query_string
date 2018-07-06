require 'query_string/version'
require 'cgi'

# Module with class methods for convertation
module QueryString
  class << self
    def build(value, prefix = nil)
      case value
      when Hash
        value.map { |k, v| build(v, prefix ? "#{prefix}[#{k}]" : k) }.join('&')
      when Array
        value.map { |v| build(v, "#{prefix}[]") }.join('&')
      when nil
        ''
      else
        "#{prefix}=#{CGI.escape(value.to_s)}"
      end
    end
  end
end

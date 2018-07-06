require 'query_string/version'

# Module with class methods for convertation
module QueryString
  class << self
    def build(value, prefix = nil)
      case value
      when Hash
        value.map do |k, v|
          build(v, prefix ? "#{prefix}[#{escape(k)}]" : escape(k))
        end.join('&')
      when Array
        value.map { |v| build(v, "#{prefix}[]") }.join('&')
      when nil then ''
      else "#{prefix}=#{escape(value)}"
      end
    end

    private

    def escape(value)
      URI.encode_www_form_component(value)
    end
  end
end

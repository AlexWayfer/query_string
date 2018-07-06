require 'query_string/version'

# Module with class methods for convertation
module QueryString
  class << self
    def build(value, prefix = nil)
      case value
      when Hash
        build_hash(value, prefix)
      when Array
        value.map { |v| build(v, "#{prefix}[]") }.join('&')
      when nil then prefix.to_s
      else
        raise ArgumentError, 'value must be a Hash' if prefix.nil?
        "#{prefix}=#{escape(value)}"
      end
    end

    private

    def build_hash(hash, prefix)
      hash.map do |k, v|
        build(v, prefix ? "#{prefix}[#{escape(k)}]" : escape(k))
      end.reject(&:empty?).join('&')
    end

    def escape(value)
      URI.encode_www_form_component(value)
    end
  end
end

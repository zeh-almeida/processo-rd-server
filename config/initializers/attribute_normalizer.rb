
AttributeNormalizer.configure do |config|
  config.normalizers[:remove_punctuation] = lambda do |value, options|
    value.is_a?(String) ? StringSanitizer.remove_punctuation(value) : value
  end

  config.normalizers[:currency_to_float] = lambda do |value, options|
    value.is_a?(String) ? StringSanitizer.currency_to_float(value) : value
  end
end

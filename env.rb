# frozen_string_literal: true

require 'json'
require 'base64'
require 'yaml'

json = JSON.parse(File.read('application.json'))
def flatten_hash(hash, parent_key = '', result = {})
  hash.each do |key, value|
    new_key = parent_key.empty? ? key.to_s : "#{parent_key}__#{key}"
    if value.is_a?(Hash)
      flatten_hash(value, new_key, result)
    else
      result[new_key] = Base64.strict_encode64(value.to_s)
    end
  end
  result
end

result = flatten_hash(json)
puts result.to_yaml

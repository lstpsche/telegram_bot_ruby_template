# frozen_string_literal: true

module Serializers
  class HashSerializer
    def self.dump(hash)
      hash.to_json
    end

    def self.load(hash)
      JSON.parse (hash || '{}')
    end
  end
end

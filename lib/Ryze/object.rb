# frozen_string_literal: true

require "ostruct"

module Ryze
  # Object is a base class for all objects returned from the Riot API.
  class Object < OpenStruct
    def initialize(attributes, client = nil)
      super to_ostruct(attributes)
      @client = client
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.transform_values { |val| to_ostruct(val) })
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else # Assumed to be a primitive value
        obj
      end
    end
  end
end

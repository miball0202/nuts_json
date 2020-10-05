# frozen_string_literal: true

require 'activesupport'
require 'oj'

module NutsJson
  class Serializer
    def initialize(resource = nil, pattern = nil)
      @resource = resource
      @pattern = pattern
    end

    def to_json(*_args)
      return Oj.dump({ keys => self.send(@pattern, @resource) }, mode: :compat) unless @resource.respond_to?(:to_a)

      Oj.dump({ key => @resource.map { |data| self.send(@pattern, data) }}, mode: :compat)
    end

    def key
      :data
    end

    private

    def keys
      key.id2name.pluralize.intern
    end
  end
end

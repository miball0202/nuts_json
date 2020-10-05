# frozen_string_literal: true

require 'oj'

class Serializer
  def initialize(resource = nil, pattern = nil)
    @resource = resource
    @pattern = pattern
  end

  def to_json(*_args)
    return Oj.dump({ key => self.send(@pattern, @resource) }, mode: :compat) unless @resource.respond_to?(:to_a)

    Oj.dump({ key => @resource.map { |data| self.send(@pattern, data) }}, mode: :compat)
  end
end

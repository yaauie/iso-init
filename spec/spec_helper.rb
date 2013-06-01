# encoding: utf-8
RSpec::Matchers.define :be_a_frozen_duplicate_of do |expected|
  match do |actual|
    next false unless actual == expected
    next false unless actual.frozen?
    next false if actual.equal?(expected) # refer to same object?
    true
  end
  failure_message_for_should do |actual|
    "expected that #{actual} would be a frozen duplicate of #{expected}"
  end
end

module Helpers
  def dupable?(obj)
    obj.dup
    true
  rescue
    false
  end
end

RSpec.configure do |c|
  c.include Helpers
end

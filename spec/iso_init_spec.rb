# encoding: utf-8
require 'iso-init'
require_relative 'spec_helper.rb'

describe IsoInit do

  let(:isolated_class_args) do
    {
      string:       'a string',
      integer:      1,
      nil_class:    nil,
      false_class:  false,
      true_class:   true,
      float:        1.1,
      array:        [1,2,3],
      hash:         { a: 1 },
    }
  end
  let(:isolated_class) do
    Class.new(Struct.new(*isolated_class_args.keys)) do
      include IsoInit
    end
  end
  let(:isolated_instance) { isolated_class.new(*isolated_class_args.values) }

  it 'should isolate anything that can be dup\'d' do
    isolated_class_args.keys.each do |key|
      isolated_instance.public_send(key).should(
        be_a_frozen_duplicate_of isolated_class_args[key]
      ) if dupable?(isolated_class_args[key])
    end
  end
end

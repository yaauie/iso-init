# encoding: utf-8
require 'iso-init/version'

module IsoInit
  def self.included(base)
    base.extend(Isolator)
  end

  module Isolator
    def new(*args, &block)
      super(*args.map(&(Isolator.method(:isolate))), &block)
    end

    def self.isolate(arg)
      arg.dup.freeze rescue arg
    end
  end
end

#! /usr/bin/env ruby
# coding: utf-8

require_relative './capture.rb'
require_relative './button.rb'

module Dashbutton

  class Server

    attr_reader :buttons, :capture

    def initialize(options={})
      @buttons = []
      @capture = Capture.new(options)
      yield self if block_given?
    end

    def add(arg, &block)
      if arg.kind_of?(Button)
        @buttons << arg
      else if arg.kind_of?(String)
        
      end
    end
    
  end
  
end

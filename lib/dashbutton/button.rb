#! /usr/bin/env ruby
# coding: utf-8

module Dashbutton

  class Button

    attr_reader :mac_address, :proc

    def initialize(mac_address, &block)
      unless mac_address =~ /^([0-9A-Z][0-9A-Z][:-]){5}[0-9A-Z][0-9A-Z]$/
        raise ArgumentError, "invalid mac address [#{mac_address}]"
      end
      raise ArgumentError, "must be given a block" if block.nil?
      @mac_address = mac_address
      @proc = block
    end

    def exec(packet)
      @proc.call(packet)
    end
    
  end
  
end

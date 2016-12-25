#! /usr/bin/env ruby
# coding: utf-8

require 'packetfu'

require_relative './pushed_signal.rb'

module DashButton
  
  class Capture

    attr_reader :options

    def initialize(options={})
      @options = {
        iface: PacketFu::Utils.whoami?[:iface],
        filter: "arp",
        start: true,
        timeout: 5000,
      }.merge(options)
      @capture = PacketFu::Capture.new(@options)
    end

    def stream_each(&block)
      @capture.stream.each do |packet|
        if PacketFu::ARPPacket.can_parse?(packet)
          signal = PushedSignal.new(PacketFu::ARPPacket.parse(packet))
          ret = block.call(signal)
          break if ret == false
        end
      end
    end

  end
  
end

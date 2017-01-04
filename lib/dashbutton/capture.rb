#! /usr/bin/env ruby
# coding: utf-8

require 'packetfu'

require_relative './packet.rb'

module Dashbutton
  
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

    def each_packet(&block)
      @capture.stream.each do |packet|
        if PacketFu::ARPPacket.can_parse?(packet)
          signal = Packet.new(PacketFu::ARPPacket.parse(packet))
          block.call(signal)
        end
      end
    end

  end
  
end

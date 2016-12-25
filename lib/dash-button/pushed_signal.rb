#! /usr/bin/env ruby
# coding: utf-8

require 'packetfu'

require_relative './manufacturer.rb'

module DashButton

  class PushedSignal

    attr_reader :arp_packet, :time_stamp

    def initialize(arp_packet)
      @arp_packet = arp_packet
      @time_stamp = Time.now
    end

    def mac_address
      PacketFu::EthHeader.str2mac(@arp_packet.eth_src)
    end

    def manufacturer
      Manufacturer.get(mac_address)
    end
    
  end
  
end

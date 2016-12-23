#! /usr/bin/env ruby
# coding: utf-8

require 'packetfu'
require 'csv'

module DashButton
  
  class Capture

    @ouis = Hash[CSV.read(File.dirname(__FILE__) + '/oui.csv').map{|ary| [ary[1], ary[2]]}]
    @ouis.default = "unknown"

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
          time_stamp = Time.now
          arp_packet = PacketFu::ARPPacket.parse(packet)
          src_mac = PacketFu::EthHeader.str2mac(arp_packet.eth_src)
          manufacturer = get_manufacturer(src_mac)
          hash = {
            time_stamp: time_stamp,
            arp_packet: arp_packet,
            src_mac: src_mac,
            manufacturer: manufacturer,
          }
          ret = block.call(hash)
          break if ret == false
        end
      end
    end

    def self.get_manufacturer(mac)
      @ouis[mac.gsub(':', '')[0,6].upcase] 
    end
    
  end
  
end

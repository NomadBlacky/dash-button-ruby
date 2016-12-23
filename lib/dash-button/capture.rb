#! /usr/bin/env ruby
# coding: utf-8

require 'packetfu'
require 'csv'

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
      @ouis = Hash[CSV.read(File.dirname(__FILE__) + '/oui.csv').map{|ary| [ary[1], ary[2]]}]
    end

    def stream_each(&block)
      @capture.stream.each do |packet|
        time_stamp = Time.now.strftime("%Y-%m-%d %H:%M:%S.%6N")
        arp_packet = ARPPacket.parse(packet)
        src_mac = EthHeader.str2mac(arp_packet.eth_src)
        manufacturer = ouis[src_mac.gsub(':', '')[0, 6].upcase]
        
      end
    end
    
  end
  
end

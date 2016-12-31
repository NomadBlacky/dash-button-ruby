#!/usr/bin/env ruby

require 'csv'
require "packetfu"
include PacketFu

def get_capture(filter)
  ouis = Hash[CSV.read('../lib/dashbutton/oui.csv').map{|ary| [ary[1], ary[2]]}]
  ouis.default = "unknown"

  capture = Capture.new(iface: Utils.whoami?[:iface], start: true, filter: filter, timeout: 5000)
  puts "Start capture."
  capture.stream.each do |packet|
    if ARPPacket.can_parse?(packet)
      time_stamp = Time.now.strftime("%Y-%m-%d %H:%M:%S.%6N")
      arp_packet = ARPPacket.parse(packet)
      src_mac = EthHeader.str2mac(arp_packet.eth_src)
      manufacturer = ouis[src_mac.gsub(':', '')[0, 6].upcase]
      #binding.pry
      puts "#{time_stamp} => #{src_mac} [#{manufacturer}]"
    end
  end

end


if $0 == __FILE__
  filter = ARGV[0]
  get_capture(filter)
end

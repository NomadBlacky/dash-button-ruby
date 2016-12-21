#!/usr/bin/env ruby

require "packetfu"
include PacketFu

def get_capture(iface,filter)
  cap = Capture.new(:iface=>iface, :start=>true, :filter=>filter)
  cap.stream.each do |pkt|
    next unless ARPPacket.can_parse?(pkt)
    t_stamp  = Time.now.strftime("%Y-%m-%d %H:%M:%S.%6N")
    arp_packet = ARPPacket.parse(pkt)
    src_mac = EthHeader.str2mac(arp_packet.eth_src)
    #src_ip = IPHeader.octet_array(arp_packet.ip_src).join('.')
    #src_port = arp_packet.tcp_src
    puts "#{t_stamp} src_mac: #{src_mac}"
  end

end


if $0 == __FILE__
  iface = ARGV[0]
  filter = ARGV[1]
  get_capture(iface, filter)
end

#! /usr/bin/env ruby
# coding: utf-8

require(File.dirname(__FILE__) +  '/../lib/dash-button.rb')

describe DashButton::Capture do

  before(:each) do
    @cap = DashButton::Capture.new
  end
    
  describe '#initialize' do

    it 'should be a default "ifce" option is PacketFu::Utils.whoami?[:iface]' do
      expect(PacketFu::Utils.whoami?[:iface]).to eq @cap.options[:iface]
    end

    it 'should be a default "filter" option is "arp"' do
      expect("arp").to eq @cap.options[:filter]
    end

  end

  describe '.get_manufacturer' do

    it 'should be return "Amazon Technologies Inc." when given argument "88:71:e5:88:e5:20"' do
      expect("Amazon Technologies Inc.").to eq DashButton::Capture.get_manufacturer("88:71:e5:88:e5:20")
    end

    it 'should be return "unknown" when given argument "ee:ee:ee:ee:ee:ee"' do
      expect("unknown").to eq DashButton::Capture.get_manufacturer("ee:ee:ee:ee:ee:ee")
    end
    
  end

end

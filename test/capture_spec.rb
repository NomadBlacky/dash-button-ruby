#! /usr/bin/env ruby
# coding: utf-8

require(File.dirname(__FILE__) +  '/../lib/dash-button.rb')

describe DashButton::Capture do

  describe '#initialize' do

    before(:each) do
      @cap = DashButton::Capture.new
    end
    
    it 'should be a default "ifce" option is PacketFu::Utils.whoami?[:iface]' do
      expect(PacketFu::Utils.whoami?[:iface]).to eq @cap.options[:iface]
    end

    it 'should be a default "filter" option is "arp"' do
      expect("arp").to eq @cap.options[:filter]
    end

  end

end

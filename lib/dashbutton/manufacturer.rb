#! /usr/bin/env ruby
# coding: utf-8

require 'csv'

module Dashbutton

  module Manufacturer

    @ouis = Hash[CSV.read(File.dirname(__FILE__) + '/oui.csv').map{|ary| [ary[1], ary[2]]}]
    @ouis.default = "unknown"

    def self.get(mac_address)
      @ouis[mac_address.gsub(':', '')[0,6].upcase] 
    end
    
  end
  
end

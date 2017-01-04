#! /usr/bin/env ruby
# coding: utf-8

describe Dashbutton::Server do

  describe "#initialize" do

    it "" do
      server = Dashbutton::Server.new()
      server.add_button("aa:aa:aa:aa:aa:aa") do |button, signal|
        
      end
    end
    
  end
  
end

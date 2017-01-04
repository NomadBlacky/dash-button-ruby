#! /usr/bin/env ruby
# coding: utf-8

require 'dashbutton'

Dashbutton::Server.new do

  add_button("aa:aa:aa:aa:aa:aa") do
    
  end

  add_switch_button("bb:bb:bb:bb:bb:bb").on do
    
  end.off do
    
  end
  
end.start()

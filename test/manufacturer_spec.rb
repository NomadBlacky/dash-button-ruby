#! /usr/bin/env ruby
# coding: utf-8

require_relative '../lib/dashbutton/manufacturer.rb'

describe Dashbutton::Manufacturer do

  it 'should be return "Amazon Technologies Inc." when given argument "88:71:e5:88:e5:20"' do
    expect("Amazon Technologies Inc.").to eq Dashbutton::Manufacturer.get("88:71:e5:88:e5:20")
  end

  it 'should be return "unknown" when given argument "ee:ee:ee:ee:ee:ee"' do
    expect("unknown").to eq Dashbutton::Manufacturer.get("ee:ee:ee:ee:ee:ee")
  end
  
end

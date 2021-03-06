# encoding: utf-8
require 'spec_helper'

describe Mail::PhraseList do

  describe "parsing" do
    it "should parse a phrase list" do
      parse_text  = '"Mikel Lindsaar", "Mikel", you, somewhere'
      doing { Mail::PhraseList.new(parse_text) }.should_not raise_error
    end

    it "should raise an error if the input is useless" do
      parse_text = nil
      doing { Mail::PhraseList.new(parse_text) }.should raise_error
    end

    it "should not raise an error if the input is empty" do
      parse_text  = '""""""""""""""""'
      Mail::PhraseList.new(parse_text).phrases.should eq [parse_text[1...-1]]
    end
  end
end

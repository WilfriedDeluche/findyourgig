# encoding: utf-8

require 'spec_helper'

describe ErrorMessagesHelper do

  class MockView < ActionView::Base
    include ErrorMessagesHelper
  end

  describe '#error_messages_for' do

    before(:each) { @template = MockView.new }

    it 'should display multiple errors hash in a list' do
      band = FactoryGirl.build(:band, :name => "")
      band.valid?
      msg = band.errors.full_messages[0]
      @template.error_messages_for(band).should == "<div class=\"alert alert-error\" id=\"error_explanation\"><a class=\"close\" data-dismiss=\"alert\">×</a><h3>1 Erreur</h3><ul><li>#{msg}</li></ul></div>"
    end
  end
end
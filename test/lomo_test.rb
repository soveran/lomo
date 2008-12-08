require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'rr'

require File.join(File.dirname(__FILE__), '../lib/lomo')

class TestLomo < Test::Unit::TestCase
  include RR::Adapters::TestUnit

  context "#new" do
    setup do
      mock(File).exists?(File.expand_path('file_name.jpg')) { true }
    end

    should "return an instance of Lomo" do
      assert_kind_of Lomo, Lomo.new('file_name.jpg')
    end
  end

  context "lomo" do
    setup do
      mock(File).exists?(File.expand_path('file_name.jpg')) { true }
      @lomo = Lomo.new('file_name.jpg')
    end

    should "return a file name with -lomo.png as part of the name" do
      assert_match /-lomo.png$/, @lomo.dest
    end
  end
end

require File.dirname(__FILE__) + '/../../spec_helper.rb'

module Spec
module Mocks
context "PassingMockArgumentConstraints" do
    setup do
        @mock = Mock.new("test mock")
      
    end
    teardown do
        @mock.__verify
      
    end
    specify "should accept false as boolean" do
        @mock.should_receive(:random_call).with(:boolean)
        @mock.random_call(false)
      
    end
    specify "should accept fixnum as numeric" do
        @mock.should_receive(:random_call).with(:numeric)
        @mock.random_call(1)
      
    end
    specify "should accept float as numeric" do
        @mock.should_receive(:random_call).with(:numeric)
        @mock.random_call(1.5)
      
    end
    specify "should accept string as anything" do
        @mock.should_receive(:random_call).with("a", :anything, "c")
        @mock.random_call("a", "whatever", "c")
      
    end
    specify "should accept true as boolean" do
        @mock.should_receive(:random_call).with(:boolean)
        @mock.random_call(true)
      
    end
    specify "should match duck type with one method" do
        @mock.should_receive(:random_call).with(DuckTypeArgConstraint.new(:length))
        @mock.random_call([])
      
    end
    specify "should match duck type with two methods" do
        @mock.should_receive(:random_call).with(DuckTypeArgConstraint.new(:abs, :div))
        @mock.random_call(1)
      
    end
    specify "should match non special symbol" do
        @mock.should_receive(:random_call).with(:some_symbol)
        @mock.random_call(:some_symbol)
      
    end
    specify "should match string" do
        @mock.should_receive(:random_call).with(:string)
        @mock.random_call("a string")
      
    end
    specify "should match user defined type" do
        @mock.should_receive(:random_call).with(Expectations::Person.new("David"))
        @mock.random_call(Expectations::Person.new("David"))
      
    end
  
end
end
end
require File.dirname(__FILE__) + '/spec_helper'

class TestModel < ActiveRecord::Base
end

describe TestModel do
  
  before do
    @model = TestModel.create(:id => 1)
  end
  
  describe "dom_id" do
    
    describe "without prefix" do
      it "should return right dom_id" do
        @model.dom_id.should == "test_model_1"
      end
    end
    
    describe "with prefix" do
      it "should return right dom_id" do
        @model.dom_id("prefix").should == "prefix_test_model_1"
      end
    end
    
    describe "with postfix" do
      it "should return right dom_id" do
        @model.dom_id(nil, "postfix").should == "test_model_1_postfix"
      end
    end
    
    describe "with postfix and prefix" do
      it "should return right dom_id" do
        @model.dom_id("prefix", "postfix").should == "prefix_test_model_1_postfix"
      end
    end
  end
  
  describe "dom_path" do
    it "should return rigth dom path" do
      @model.dom_path.should == "test_models"
    end
  end
  
  describe "dom class" do
    describe "without prefix" do
      it "should return class name" do
        @model.dom_class.should == "test_model"
      end
    end
    
    describe "with prefix" do  
      it "should return class name" do
        @model.dom_class("prefix").should == "prefix_test_model"
      end      
    end
    
    describe "with singular option" do
      it "should return right dom path" do
        @model.dom_class(nil, false).should == "test_models"
      end
    end 
  end
end
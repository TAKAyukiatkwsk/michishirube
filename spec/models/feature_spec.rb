require 'spec_helper'

describe Feature do

  before(:each) do
    @feature = FactoryGirl.build(:feature)
  end

  it "is valid with valid attributes" do
    @feature.should be_valid
  end

  it "is not valid with no name" do
    @feature.name = nil
    @feature.should_not be_valid
  end

end


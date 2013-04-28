require 'spec_helper'

describe :features do

  describe "POST create" do

    it "creates new feature" do
      feature = mock(Feature).as_null_object
      Feature.should_receive(:new).with(name: 'a new feature').
        and_return(feature)
      post "/features", feature: {name: 'a new feature'}
    end

    it "saves the feature" do
      feature = mock(Feature)
      Feature.stub(:new).and_return(feature)
      feature.should_receive(:save)
      post "/features", feature: {name: 'a new feature'}
    end

  end

end

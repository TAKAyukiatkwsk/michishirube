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
      feature = mock(Feature).as_null_object
      Feature.stub(:new).and_return(feature)
      feature.should_receive(:save)
      post "/features", feature: {name: 'a new feature'}
    end

    it "redirects features index page" do
      post "/features", feature: {name: 'a new feature'}
      last_response.should be_redirect
      last_response.location.should include '/features'
    end

  end

  describe "POST update" do
    it "responses json" do
      feature = FactoryGirl.create(:feature)
      post "/features/#{feature.id}.json", feature: {name: 'update'}
      last_response.content_type.should include "json"
    end

    it "responses json with valid values" do
      feature = FactoryGirl.create(:feature)
      post "/features/#{feature.id}.json",
        feature: {name: 'update', deadline_year: '2014', deadline_month: '1', deadline_day: '15' }
      json = {feature: {name: 'update', deadline: Time.new(2014, 1, 15), deadline_year: '2014', deadline_month: '01', deadline_day: '15'}}.to_json
      last_response.body.should == json
    end

    context "when updating invalid values" do
      it "responses with HTTP code 400" do
        feature = FactoryGirl.create(:feature)
        post "/features/#{feature.id}.json",
          feature: {name: '', deadline_year: '2014', deadline_month: '1',
                    deadline_day: '15' }
        last_response.status.should == 400
      end
    end
  end

end

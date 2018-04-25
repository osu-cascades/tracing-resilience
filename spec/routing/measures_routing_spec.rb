require "rails_helper"

RSpec.describe MeasuresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/measures").to route_to("measures#index")
    end

    it "routes to #new" do
      expect(:get => "/measures/new").to route_to("measures#new")
    end

    it "routes to #show" do
      expect(:get => "/measures/1").to route_to("measures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/measures/1/edit").to route_to("measures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/measures").to route_to("measures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/measures/1").to route_to("measures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/measures/1").to route_to("measures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/measures/1").to route_to("measures#destroy", :id => "1")
    end

  end
end

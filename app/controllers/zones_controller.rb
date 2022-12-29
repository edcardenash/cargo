class ZonesController < ApplicationController
  def new
    @regions = Region.all
    @cities = City.all
    @zone = Zone.new
  end

  def create
  end
end

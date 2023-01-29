class PricesController < ApplicationController

  def new
    @price = Price.new
  end

  def create
    @price = Price.create!(:amount)
  end
end

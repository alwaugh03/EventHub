class PagesController < ApplicationController
  def home
    @events = Event.limit(5)
  end

  def events
  end

  def categories
  end

  def login
  end

  def signup
  end
end

class PagesController < ApplicationController
  def home
   @title="home"
  end

  def contact
   @title="comtact"
  end

  def about
   @title="About"
  end
end

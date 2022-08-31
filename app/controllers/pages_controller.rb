class PagesController < ApplicationController
  layout false
  def home
  end

  def view
    render layout: false
  end
end

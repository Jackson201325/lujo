class PagesController < ApplicationController
  skip_before_user :authenticate_user!, only: :home
  
  def home
  end
end

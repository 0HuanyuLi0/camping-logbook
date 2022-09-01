class PagesController < ApplicationController
  def home


  end

  def search
 
  
    @rlts = Site.where("lower(location) LIKE ?", "%" + params[:search].downcase + "%").or(
      Site.where("lower(name) LIKE ?", "%" + params[:search].downcase + "%")
    )

  end
end

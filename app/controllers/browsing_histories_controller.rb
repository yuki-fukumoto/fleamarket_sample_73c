class BrowsingHistoriesController < ApplicationController

  def index
    @history = BrowsingHistory.where(user_id: current_user.id).order('created_at DESC')
  end

end

class FavoritesController < ApplicationController
  def index
    @favorites = MemberFavourite.where(user_id: current_user['id']).select([:id, :title, :favourite_id, :favorite_type])
  end

  def create
    checkFav = MemberFavourite.find_by(favourite_id: params['member_favourite']['id'], user_id: current_user['id'])
    redirect_path_to = params['member_favourite']['type'] == 'anime' ? anime_path(params['member_favourite']['id']) : manga_path(params['member_favourite']['id'])
    if checkFav
      respond_to do |format|
        if checkFav.destroy
          format.html { redirect_to redirect_path_to, notice: "Favorites deleted" }
          format.json { render :index, status: :created, location: @user }
        else
          format.html { render redirect_path_to, alert: "Failed to delete favorites" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      favorites = MemberFavourite.new
      favorites.user_id = current_user['id']
      favorites.title = params['member_favourite']['title']
      favorites.favourite_id = params['member_favourite']['id']
      favorites.score = params['member_favourite']['score']
      favorites.favorite_type = params['member_favourite']['type']

      respond_to do |format|
        if favorites.save!
          format.html { redirect_to redirect_path_to, notice: "Added to favorites" }
          format.json { render :index, status: :created, location: @user }
        else
          format.html { render redirect_path_to, alert: "Failed to added" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end

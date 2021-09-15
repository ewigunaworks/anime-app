class Api::FavoritesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, :only => [:index, :get_top_favorite, :get_total_user_favorite]
  # GET /articles
    def index
     @favorites = MemberFavourite.all
     render json: @favorites
    end

    def get_top_favorite
      limit = params['limit'].to_i
      offset = (params['page'].to_i * limit) - limit
      if params['type'] == 'all' || params['type'] == ''
        @favorites = MemberFavourite.where(user_id: params['id']).order(score: 'desc').limit(limit).offset(offset)
      else
        @favorites = MemberFavourite.where(user_id: params['id'], favorite_type: params['type']).order(score: 'desc').limit(limit).offset(offset)
      end

      data = {
        status: true,
        message: 'success',
        data: @favorites
      }

      render json: data
    end

    def get_total_user_favorite
      limit = params['limit'].to_i
      offset = (params['page'].to_i * limit) - limit
      sql = "SELECT title, favourite_id, COUNT(DISTINCT user_id) as total FROM member_favourites GROUP BY favourite_id ORDER BY COUNT(DISTINCT user_id) DESC LIMIT #{limit} OFFSET #{offset}"
      records_array = ActiveRecord::Base.connection.execute(sql)

      data = {
        status: true,
        message: 'success',
        data: records_array
      }

      render json: data
    end
  end

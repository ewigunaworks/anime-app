class AnimesController < ApplicationController
  def index
    url = 'https://api.jikan.moe/v3/top/anime/1/favorite'
    res = Faraday.get(url)
    body_hash = JSON.parse(res.body)
    @animes = body_hash['top']

    params = {
      url: url,
      method: 'GET',
      status: res.status
    }
    HistoryLogsWorker.perform_async(params)
  end

  def show
    url = "https://api.jikan.moe/v3/anime/#{params[:id]}"
    res = Faraday.get(url)
    body_hash = JSON.parse(res.body)
    @animes = body_hash

    params = {
      url: url,
      method: 'GET',
      status: res.status
    }
    HistoryLogsWorker.perform_async(params)

    @favorites_added = MemberFavourite.find_by(favourite_id: @animes['mal_id'], user_id: current_user['id'])
  end
end

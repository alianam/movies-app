class FeedsController < ApplicationController
  def index
    if params[:feed] == 'rollingstone'
      @movie_titles = Feed.rolling_stone('title')
      @content = Feed.rolling_stone('content:encoded')
      @image = Feed.rolling_stone('media:group//media:content')
    else
      @movies = Feed.description(params[:feed])
      @movie_titles = Feed.title(params[:feed])
      @movie_titles.shift
    end
  end
end

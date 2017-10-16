class FeedsController < ApplicationController
  def index
    if params[:feed] == 'rollingstone'
      @movie_titles = Feed.rolling_stone('title')
      @movie_titles.shift
      @content = Feed.rolling_stone('content:encoded')
      @image = Feed.rolling_stone('media:group//media:content')
      @image_2 = []
      @image.each_with_index do |movie, index|
        if (index %2 ==0)
          @image_2 << movie
        end
      end
    elsif params[:feed] == 'nytimes'
      @content = Feed.nytimes
    else
      @movies = Feed.description(params[:feed])
      @movie_titles = Feed.title(params[:feed])
      @movie_titles.shift
    end
  end
end

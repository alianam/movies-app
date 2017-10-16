class Feed < ApplicationRecord
  def nytimes
    
  end

  def self.description(feed_type)
    if feed_type == 'indie'
      doc = Nokogiri::XML(open("https://www.fandango.com/movies/indie/rss/movie-list.rss"))
    else
      doc = Nokogiri::XML(open("https://www.fandango.com/rss/#{feed_type}.rss"))
    end
    doc.xpath("//description")
  end

  def self.title(feed_type)
    doc = Nokogiri::XML(open("https://www.fandango.com/rss/#{feed_type}.rss"))
    doc.css('title')
  end

  def self.rolling_stone(parser)
    doc = Nokogiri::XML(open("http://www.rollingstone.com/reviews/rss"))
    doc.xpath("//#{parser}")
  end

  def self.nytimes
    uri = URI("https://api.nytimes.com/svc/movies/v2/reviews/picks.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "#{ENV['API_KEY']}",
      "order" => "by-publication-date"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    result = JSON.parse(http.request(request).body)
  end
end

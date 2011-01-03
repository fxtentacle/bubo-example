class SearchController < ApplicationController

  def index
  end
  
  def result
    @rnd = ActiveSupport::SecureRandom.base64(6)
    File.open("#{RAILS_ROOT}/tmp/query", "wb") { |f| f.write(params[:upload].read) }
  end
  
  def result2
    @query_img_url = url_for :controller => 'search', :action => 'query'
    @retrieval = make_bubo.retrieve(@query_img_url)
  end
  
  def query
    response.headers['Cache-Control'] = 'public, max-age=300'
    send_file("#{RAILS_ROOT}/tmp/query")
  end
  
end

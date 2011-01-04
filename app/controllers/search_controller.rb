class SearchController < ApplicationController

  def index
  end
  
  def result
    if params[:url]
      @query_img_url = params[:url]
    else
      @rnd = ActiveSupport::SecureRandom.base64(6)
      File.open("#{RAILS_ROOT}/tmp/query", "wb") { |f| f.write(params[:upload].read) }
      @query_img_url = (url_for :controller => 'search', :action => 'query') + '?rnd='+@rnd 
    end
    
    @result2_url = url_for :controller => 'search', :action => 'result2', :q => @query_img_url
  end
  
  def result2
    @query_img_url = params[:q]
    @retrieval = make_bubo.retrieve(@query_img_url)
  end
  
  def query
    response.headers['Cache-Control'] = 'public, max-age=300'
    send_file("#{RAILS_ROOT}/tmp/query")
  end
  
end

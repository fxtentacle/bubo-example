module SearchHelper
  def preview_url(url)
    url = Image.find(url.to_i).url
    if url =~ /.*?@spratpix-fs\/(.*?)\/full\/(.*)/
      url = 'https://pict-01.spratshop.com/spratpix-FS/get/c/'+$1+'/wm250/'+$2
    end
    url
  end
  
  def link_url(url)
    url = Image.find(url.to_i).url
    if url =~ /.*?@spratpix-fs\/(.*?)\/full\/(.*)/
      url = 'https://'+$1+'.spratshop.com/search.html?q='+$2
    end
    url
  end
  
end

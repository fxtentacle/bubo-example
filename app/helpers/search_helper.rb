module SearchHelper
  def preview_url(url)
    if url =~ /.*?@spratpix-fs\/(.*?)\/full\/(.*)/
      url = 'https://pict-01.spratshop.com/spratpix-FS/get/c/'+$1+'/wm250/'+$2
    end
    url
  end
end

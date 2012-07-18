require 'rubygems'
require 'bundler'
Bundler.require

get '/favicon.ico' do
  nil
end

get '/:id' do
  id = Brid.detect(params[:id])
  
  JSONP(
    :document   => id.to_s,
    :validation => id.valid?,
    :origin     => id.origin
  ) 
end



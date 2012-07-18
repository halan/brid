require 'rubygems'
require 'bundler'
Bundler.require

get '/favicon.ico' do
  nil
end

get '/:id' do
  id = Brid.detect(params['id'])
  
  if id
    JSONP(
      :document   => id.to_s,
      :validation => id.valid?,
      :origin     => (id.origin if id.methods.include? :origin)
    ) 
  else
    JSONP(
      :document     => params['id'],
      :validattion  => false,
      :origin       => []
    )
  end
end



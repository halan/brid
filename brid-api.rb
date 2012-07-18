require 'rubygems'
require 'bundler'
Bundler.require

get '/:id' do
  Brid.detect(params[:id]).to_s
end

require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'json'

class Quote < ActiveRecord::Base; end


get '/?:number?' do
  content_type :json
  number = Integer(params[:number] || 1) rescue 1
  number = 10 if number > 10
  @quotes = Quote.limit( number ).order( "RANDOM()" )
  @quotes.to_json
end
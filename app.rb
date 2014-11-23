require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'pry'

class Quote < ActiveRecord::Base; end


get '/?:number?' do
  number = Integer(params[:number] || 1) rescue 1
  @quotes = Quote.limit( number ).order( "RANDOM()" )
  @quotes.to_json
end
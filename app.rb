# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/new' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end

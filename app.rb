require 'sinatra/base'
 require 'bookmarks_list'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello world'
  end

  get '/bookmarks' do
    @bookmarks = BookmarkList.new
    @list = @bookmarks.show
    erb :bookmarks
  end

  run! if app_file == $0
end

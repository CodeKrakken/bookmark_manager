require 'pg'
class BookmarkList

  def initialize
    @list = []
    @con = PG.connect :dbname => 'bookmark_manager'
  end

  def show
    result = @con.exec "SELECT url FROM bookmarks"
    @list = result.values
    @list.flatten
  end

  def add(bookmark)
    @list << bookmark
  end

end

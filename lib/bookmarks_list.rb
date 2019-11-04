class BookmarkList

  def initialize
    @list = []
  end

  def show
    @list
  end

  def add(bookmark)
    @list << bookmark
  end

end

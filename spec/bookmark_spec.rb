# frozen_string_literal: true

require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://destroyallsoftware.com", title: "DESTROY!!!!")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers'
    expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'test title')
    persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
    expect(bookmark.title).to eq 'test title'
  end
end

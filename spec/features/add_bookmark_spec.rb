# frozen_string_literal: true

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/')
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'test title')
    click_button('Submit')
    expect(page).to have_link('test title', href: 'http://testbookmark.com')
  end
end

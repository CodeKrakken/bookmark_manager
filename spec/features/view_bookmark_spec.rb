feature 'view bookmark' do
  scenario 'view one bookmark' do
    visit('/bookmarks')
    expect(page).to have_content 'bookmark1'
  end
end

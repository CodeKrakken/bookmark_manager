# feature 'view bookmark' do
#   scenario 'view one bookmark' do
#     allow_any_instance_of(BookmarkList).to receive(:show).and_return(['bookmark1'])
#     visit('/bookmarks')
#     expect(page).to have_content 'bookmark1'
#   end

#   scenario 'view two bookmarks' do
#     allow_any_instance_of(BookmarkList).to receive(:show).and_return(['bookmark1', 'bookmark2'])
#     visit('/bookmarks')
#     expect(page).to have_content 'bookmark1'
#     expect(page).to have_content 'bookmark2'
#   end
# end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end

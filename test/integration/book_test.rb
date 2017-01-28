require 'test_helper'

class BookTest < ActionDispatch::IntegrationTest
test "lets a signed in user create a new book" do
    login_as users(:george)
    visit "/books/new"
    fill_in "book_title", with: "Le Wagon"
    fill_in "book_description", with: "Change your life: Learn to code"
    fill_in "book_price", with: "45"
    click_button "Creer l'annonce"
    assert_equal "/books.1", page.current_path
    assert_equal 200, page.status_code
    assert page.has_content?("Le Wagon")
  end
end

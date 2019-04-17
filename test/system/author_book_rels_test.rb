require "application_system_test_case"

class AuthorBookRelsTest < ApplicationSystemTestCase
  setup do
    @author_book_rel = author_book_rels(:one)
  end

  test "visiting the index" do
    visit author_book_rels_url
    assert_selector "h1", text: "Author Book Rels"
  end

  test "creating a Author book rel" do
    visit author_book_rels_url
    click_on "New Author Book Rel"

    click_on "Create Author book rel"

    assert_text "Author book rel was successfully created"
    click_on "Back"
  end

  test "updating a Author book rel" do
    visit author_book_rels_url
    click_on "Edit", match: :first

    click_on "Update Author book rel"

    assert_text "Author book rel was successfully updated"
    click_on "Back"
  end

  test "destroying a Author book rel" do
    visit author_book_rels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Author book rel was successfully destroyed"
  end
end

require 'test_helper'

class AuthorBookRelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_book_rel = author_book_rels(:one)
  end

  test "should get index" do
    get author_book_rels_url
    assert_response :success
  end

  test "should get new" do
    get new_author_book_rel_url
    assert_response :success
  end

  test "should create author_book_rel" do
    assert_difference('AuthorBookRel.count') do
      post author_book_rels_url, params: { author_book_rel: {  } }
    end

    assert_redirected_to author_book_rel_url(AuthorBookRel.last)
  end

  test "should show author_book_rel" do
    get author_book_rel_url(@author_book_rel)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_book_rel_url(@author_book_rel)
    assert_response :success
  end

  test "should update author_book_rel" do
    patch author_book_rel_url(@author_book_rel), params: { author_book_rel: {  } }
    assert_redirected_to author_book_rel_url(@author_book_rel)
  end

  test "should destroy author_book_rel" do
    assert_difference('AuthorBookRel.count', -1) do
      delete author_book_rel_url(@author_book_rel)
    end

    assert_redirected_to author_book_rels_url
  end
end

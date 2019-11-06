require 'test_helper'

class RuWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ru_word = ru_words(:one)
  end

  test "should get index" do
    get ru_words_url, as: :json
    assert_response :success
  end

  test "should create ru_word" do
    assert_difference('RuWord.count') do
      post ru_words_url, params: { ru_word: { name: @ru_word.name } }, as: :json
    end

    assert_response 201
  end

  test "should show ru_word" do
    get ru_word_url(@ru_word), as: :json
    assert_response :success
  end

  test "should update ru_word" do
    patch ru_word_url(@ru_word), params: { ru_word: { name: @ru_word.name } }, as: :json
    assert_response 200
  end

  test "should destroy ru_word" do
    assert_difference('RuWord.count', -1) do
      delete ru_word_url(@ru_word), as: :json
    end

    assert_response 204
  end
end

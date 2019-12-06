# frozen_string_literal: true

require 'test_helper'

class EnWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @en_word = en_words(:one)
  end

  test 'should get index' do
    get en_words_url, as: :json
    assert_response :success
  end

  test 'should create en_word' do
    assert_difference('EnWord.count') do
      post en_words_url, params: { en_word: { name: @en_word.name } }, as: :json
    end

    assert_response 201
  end

  test 'should show en_word' do
    get en_word_url(@en_word), as: :json
    assert_response :success
  end

  test 'should update en_word' do
    patch en_word_url(@en_word), params: { en_word: { name: @en_word.name } }, as: :json
    assert_response 200
  end

  test 'should destroy en_word' do
    assert_difference('EnWord.count', -1) do
      delete en_word_url(@en_word), as: :json
    end

    assert_response 204
  end
end

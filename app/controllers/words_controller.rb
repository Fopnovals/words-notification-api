# frozen_string_literal: true

class WordsController < ApplicationController
  before_action :set_words, only: %i[create check_translation]
  before_action :authorize_request

  # GET /words
  def index
    # @words = Word.all
    #
    # render json: @words
  end

  # GET /words/1
  def show
    require 'fcm'

    fcm = FCM.new('AAAAj6hDgHo:APA91bESEuM-CeYqXu9CQfXsp5VBaXXWO66kGnIF8qicqV881hNgzJSEnANSLWuOyC3ye0BaR04sDheLpZJuXgSGShi6-yEI94xUTVJLgn51tweiT5vA8Rx5hc9ix0v3dkwHtEOYNsV2')
    registration_ids = %w[12 13]
    options = {
      "notification": {
        "title": 'Portugal vs. Denmark',
        "body": '5 to 1'
      }
    }
    response = fcm.send(registration_ids, options)
    # render json: @word
  end

  # POST /words
  def create
    @en_word ||= English.create(name: params[:en])
    @ru_word ||= Russian.create(name: params[:ru])

    a = @en_word.russians
    a.map(&:id).include?(@ru_word.id) ? false : (@en_word.russians.push @ru_word)

    association = associate_with_collection if params[:collection_id]

    if @ru_word && @en_word
      data = { ru: @ru_word, en: @en_word }
      association ? data[:collection] = association : false
      render json: data, status: :created
    else
      association_error = "You can't add words to Collection if you are not creator or this Collection did not find" unless association
      render json: { ruErr: @ru_word.errors, enErr: @en_word.errors, associateErr: association_error }, status: :unprocessable_entity
    end
  end

  def check_translation
    correct = @en_word && @ru_word && @en_word.russians.map(&:id).include?(@ru_word.id)
    render json: { result: correct }
  end

  # PATCH/PUT /words/1
  def update
    # if @word.update(word_params)
    #   render json: @word
    # else
    #   render json: @word.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /words/1
  def destroy
    @word.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def get_word
  #   @word = Word.find(params[:id])
  # end

  def set_words
    @en_word = params[:en] && English.find_by(name: params[:en].downcase)
    @ru_word = params[:ru] && Russian.find_by(name: params[:ru].downcase)
  end

  def associate_with_collection
    collection = Collection.find(params[:collection_id])
    return false unless collection

    allowed = @current_user.id == collection.creator_id
    if collection && allowed
      has_already_ru = collection.russians.map(&:id).include?(@ru_word.id)
      has_already_en = collection.englishes.map(&:id).include?(@en_word.id)
      collection.russians.push(@ru_word) unless has_already_ru
      collection.englishes.push(@en_word) unless has_already_en
      collection
    else
      false
    end
  end
end

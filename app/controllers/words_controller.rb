class WordsController < ApplicationController
  before_action :set_words, only: [:create, :check_translation]

  # GET /words
  def index
    # @words = Word.all
    #
    # render json: @words
  end

  # GET /words/1
  def show
    # render json: @word
  end

  # POST /words
  def create
    @en_word ||= English.create(name: params[:en])
    @ru_word ||= Russian.create(name: params[:ru])

    a = @en_word.russians
    a.map(&:id).include?(@ru_word.id) ? false : (@en_word.russians.push @ru_word)

    if @ru_word && @en_word
      render json: { ru: @ru_word, en: @en_word }, status: :created
    else
      render json: { ruErr: @ru_word.errors, enErr: @en_word.errors}, status: :unprocessable_entity
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

  # Only allow a trusted parameter "white list" through.
  # def word_params
  #   params.fetch(:word, {})
  # end
end

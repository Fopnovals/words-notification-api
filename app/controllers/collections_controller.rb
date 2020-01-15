# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :authorize_request

  # POST /collections
  def create
    @collection = exists_collection || Collection.create(collection_params)
    if @collection
      render json: { collection: @collection }, status: :created
    else
      render json: { err: @collection.errors }, status: :unprocessable_entity
    end
  end

  private

  def exists_collection
    Collection.find_by(name: params[:name], creator_id: @current_user.id)
  end

  def collection_params
    { name: params[:name], creator_id: @current_user.id }
  end
end

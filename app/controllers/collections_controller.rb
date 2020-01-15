# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :authorize_request

  # # GET /collections/{}
  # def show
  #   if params[:id] == 'me'
  #     collections = @current_user.collections
  #   else
  #     collections = Collection
  #   end
  #   render json: { first_name: @user.first_name, last_name: @user.last_name, role: @user.role, image: @user.photo_url }, status: :ok
  # end

  # POST /collections
  def create
    @collection = exists_collection || new_collection
    if @collection
      render json: { collection: @collection }, status: :created
    else
      render json: { err: @collection.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /collections/{collection_id}
  def destroy
    collection = Collection.find(params[:id])
    if collection.creator_id == @current_user.id
      collection.destroy
      render status: :ok
    else
      render json: { errors: "You can't delete not yours collection" },
             status: :unprocessable_entity
    end
  end

  private

  def exists_collection
    Collection.find_by(name: params[:name], creator_id: @current_user.id)
  end

  def new_collection
    collection = Collection.create(collection_params)
    @current_user.collections.push(collection)
    collection
  end

  def collection_params
    { name: params[:name], creator_id: @current_user.id }
  end
end

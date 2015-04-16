class TagsController < ApplicationController
  include TagsHelper

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:success] = "Tag has been deleted"
    redirect_to tags_path(@tag)
  end
end

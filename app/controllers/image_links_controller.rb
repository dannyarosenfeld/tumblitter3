class ImageLinksController < ApplicationController
    before_action :find_image_link, only: [:show, :edit, :update, :destroy]


    def index
        @image_links = ImageLink.all
    end
        
    def show
        @image_link = ImageLink.find(params[:id])
    end

    def new
        @image_link = current_user.image_links.build
    end

    def edit
        @image_link = ImageLink.find(params[:id])
    end

    def create
        @image_link = current_user.image_links.build(url: params[:image_link][:url], title: params[:image_link][:title])
    if  @image_link.save
        redirect_to image_links_path
    else
         @errors = @image_link.errors
         render :new
    end
    end

    def update
        @image_link = ImageLink.find(params[:id])
    if  @image_link.update(url: params[:image_link][:url], title: params[:image_link][:title])
        redirect_to image_links_path
    else
        @errors = @image_link.errors
        render :edit
    end
    end

    def destroy
       
        @image_link.destroy
        redirect_to image_links_path
    end
        
        
    private
  def image_link_params
    params.require(:image_link).permit(:url, :title)
  end   

  def find_image_link
    @image_link = ImageLink.find(params[:id])
  end 
end

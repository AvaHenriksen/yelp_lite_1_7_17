class DetailsController < ApplicationController
  def index
    @q = Detail.ransack(params[:q])
    @details = @q.result(:distinct => true).includes(:restaurant).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@details.where.not(:address_latitude => nil)) do |detail, marker|
      marker.lat detail.address_latitude
      marker.lng detail.address_longitude
      marker.infowindow "<h5><a href='/details/#{detail.id}'>#{detail.restaurant_id}</a></h5><small>#{detail.address_formatted_address}</small>"
    end

    render("details/index.html.erb")
  end

  def show
    @detail = Detail.find(params[:id])

    render("details/show.html.erb")
  end

  def new
    @detail = Detail.new

    render("details/new.html.erb")
  end

  def create
    @detail = Detail.new

    @detail.restaurant_id = params[:restaurant_id]
    @detail.description = params[:description]
    @detail.address = params[:address]
    @detail.website = params[:website]
    @detail.cover_photo = params[:cover_photo]

    save_status = @detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/details/new", "/create_detail"
        redirect_to("/details")
      else
        redirect_back(:fallback_location => "/", :notice => "Detail created successfully.")
      end
    else
      render("details/new.html.erb")
    end
  end

  def edit
    @detail = Detail.find(params[:id])

    render("details/edit.html.erb")
  end

  def update
    @detail = Detail.find(params[:id])

    @detail.restaurant_id = params[:restaurant_id]
    @detail.description = params[:description]
    @detail.address = params[:address]
    @detail.website = params[:website]
    @detail.cover_photo = params[:cover_photo]

    save_status = @detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/details/#{@detail.id}/edit", "/update_detail"
        redirect_to("/details/#{@detail.id}", :notice => "Detail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Detail updated successfully.")
      end
    else
      render("details/edit.html.erb")
    end
  end

  def destroy
    @detail = Detail.find(params[:id])

    @detail.destroy

    if URI(request.referer).path == "/details/#{@detail.id}"
      redirect_to("/", :notice => "Detail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Detail deleted.")
    end
  end
end

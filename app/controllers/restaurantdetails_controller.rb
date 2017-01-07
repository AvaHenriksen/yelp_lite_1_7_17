class RestaurantdetailsController < ApplicationController
  def index
    @restaurantdetails = Restaurantdetail.all

    render("restaurantdetails/index.html.erb")
  end

  def show
    @restaurantdetail = Restaurantdetail.find(params[:id])

    render("restaurantdetails/show.html.erb")
  end

  def new
    @restaurantdetail = Restaurantdetail.new

    render("restaurantdetails/new.html.erb")
  end

  def create
    @restaurantdetail = Restaurantdetail.new

    @restaurantdetail.restaurant_id = params[:restaurant_id]
    @restaurantdetail.description = params[:description]
    @restaurantdetail.address = params[:address]
    @restaurantdetail.website = params[:website]
    @restaurantdetail.cover_photo = params[:cover_photo]

    save_status = @restaurantdetail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurantdetails/new", "/create_restaurantdetail"
        redirect_to("/restaurantdetails")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurantdetail created successfully.")
      end
    else
      render("restaurantdetails/new.html.erb")
    end
  end

  def edit
    @restaurantdetail = Restaurantdetail.find(params[:id])

    render("restaurantdetails/edit.html.erb")
  end

  def update
    @restaurantdetail = Restaurantdetail.find(params[:id])

    @restaurantdetail.restaurant_id = params[:restaurant_id]
    @restaurantdetail.description = params[:description]
    @restaurantdetail.address = params[:address]
    @restaurantdetail.website = params[:website]
    @restaurantdetail.cover_photo = params[:cover_photo]

    save_status = @restaurantdetail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurantdetails/#{@restaurantdetail.id}/edit", "/update_restaurantdetail"
        redirect_to("/restaurantdetails/#{@restaurantdetail.id}", :notice => "Restaurantdetail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurantdetail updated successfully.")
      end
    else
      render("restaurantdetails/edit.html.erb")
    end
  end

  def destroy
    @restaurantdetail = Restaurantdetail.find(params[:id])

    @restaurantdetail.destroy

    if URI(request.referer).path == "/restaurantdetails/#{@restaurantdetail.id}"
      redirect_to("/", :notice => "Restaurantdetail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Restaurantdetail deleted.")
    end
  end
end

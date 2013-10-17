class StuffsController < ApplicationController
  before_filter :authenticate_user!
  # GET /stuffs
  # GET /stuffs.json
  def index
    @stuffs = current_user.stuffs.paginate(page: params[:page], per_page: 8)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stuffs }
    end
  end

  # GET /stuffs/1
  # GET /stuffs/1.json
  def show
    @stuff = current_user.stuffs.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stuff }
    end
  end

  # GET /stuffs/new
  # GET /stuffs/new.json
  def new
    @stuff = current_user.stuffs.new
    5.times do
      @stuff.assets.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stuff }
    end
  end

  # GET /stuffs/1/edit
  def edit
    @stuff = current_user.stuffs.find(params[:id])
    if @stuff.assets.size == 0
      5.times do
        @stuff.assets.build
      end
    else
      (5 - @stuff.assets.size).times do
        @stuff.assets.build
      end
    end
  end

  # POST /stuffs
  # POST /stuffs.json
  def create
    @stuff = current_user.stuffs.new(params[:stuff])
    respond_to do |format|
      if @stuff.save
        format.html { redirect_to @stuff, notice: 'Stuff was successfully created.' }
        format.json { render json: @stuff, status: :created, location: @stuff }
      else
        format.html { render action: "new" }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stuffs/1
  # PUT /stuffs/1.json
  def update
    @stuff = current_user.stuffs.find(params[:id])
    respond_to do |format|
      if @stuff.update_attributes(params[:stuff])
        format.html { redirect_to @stuff, notice: 'Stuff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffs/1
  # DELETE /stuffs/1.json
  def destroy
    @stuff = Stuff.find(params[:id])
    @stuff.destroy

    respond_to do |format|
      format.html { redirect_to stuffs_url }
      format.json { head :no_content }
    end
  end

  private
  def stuff_params
    params.require(:stuff).permit(:name, :assets_attributes, :price, :tag_list,:user_id)
  end
end

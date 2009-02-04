class PhotosController < ApplicationController
  before_filter :login_required, :only => [ :edit, :update, :new, :create ]
  skip_before_filter :verify_authenticity_token, :only => [ :update ]
  
  # GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.paginate :all, :conditions => 'thumbnail is NULL', :page => params[:page], :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = current_user.photos.new params[:photo]
    
    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to(@photo) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = current_user.photos.find params[:id]
    respond_to do |format|
      if @photo.update_attributes params[:photo]
        format.html do
          flash[:notice] = 'Photo was successfully updated.'
          redirect_to(@photo)
        end
        format.xml { head :ok }
        format.js do
          if params[:field]
            render :text => @photo.attributes[params[:field]]
          else
            head :ok
          end
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
        format.js   { render :text => @photo.errors.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end
end

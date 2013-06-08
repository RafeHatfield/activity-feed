class ActivitiesController < ApplicationController
  
  caches_action :feed, :expires_in => 1.minute
  caches_action :display
  cache_sweeper :activity_sweeper,:only => [:create, :update, :destroy]
  
  # GET /activities/feed(/:id)
  def feed
    if params[:id]
      @activities = Activity.get_more_recent_than(params[:id])
    else
      @activities = Activity.get_most_recent
    end
    render :layout => false
  end
  
  # GET /activities/display
  def display
    #@activities = Activity.get_most_recent
    render :layout => false
  end 
    
  # GET /activities
  def index
    @activities = Activity.limit(100)
  end

  # GET /activities/1
  def show
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  def create
    @activity = Activity.new

    @activity.message = params[:activity][:message]
    @activity.permalink = params[:activity][:permalink]
    @activity.activity_type = ActivityType.where(:name => params[:activity][:activity_type_name]).first
 
    if @activity.save
      head :created
    else
      head :bad_request
    end
  end
  
  private
  
  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # PUT /activities/1
  def update
    @activity = Activity.find(params[:id])

    @activity.message = params[:activity][:message]
    @activity.permalink = params[:activity][:permalink]
    @activity.activity_type = ActivityType.where(:name =>  params[:activity][:activity_type_name]).first

    if @activity.save
      redirect_to(@activity, :notice => 'Activity was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /activities/1
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url)
  end
end

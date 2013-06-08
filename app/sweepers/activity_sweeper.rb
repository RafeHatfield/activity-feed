class ActivitySweeper < ActionController::Caching::Sweeper
  observe Activity
  
  def after_save(activity)
    clear_activities_cache(activity)
  end

  def after_destroy(activity)
    clear_activities_cache(activity)
  end
  
  def clear_activities_cache(activity)
    expire_action :controller => :activities, :action => :feed
    expire_action :controller => :activities, :action => :display
  end
end
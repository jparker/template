module UrgeToPunt::ActiveSupport::CoreExtensions::Date::Calculations
  def weeks_ago(weeks)
    advance(:weeks => -weeks)
  end
  
  def weeks_since(weeks)
    advance(:weeks => weeks)
  end
  
  def last_week
    weeks_ago(1)
  end
  
  # WARNING! This overwrites the #next_week method defined in ActiveSupport.
  # That method advances the date to the Monday (unless otherwise specified)
  # of the following week. I am more interested in having the methods
  # #last_week and #next_week and having them behave in the same spirit as
  # #last_month and #next_month.
  #
  # This will, of course, come back to haunt me.
  def next_week
    weeks_since(1)
  end
  
  def quarters_ago(quarters)
    advance(:months => -quarters * 3)
  end
  
  def quarters_since(quarters)
    advance(:months => quarters * 3)
  end
  
  def last_quarter
    quarters_ago(1)
  end
  
  def next_quarter
    quarters_since(1)
  end
end

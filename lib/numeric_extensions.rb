class Numeric
  # They added #fortnight! Why couldn't they have added #quarter?
  def quarters
    (3 * self).months
  end
  alias :quarter :quarters
end

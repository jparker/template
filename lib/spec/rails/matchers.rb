# Extensions to the rspec_on_rails_matchers plugin
module Spec::Rails::Matchers
  def validate_numericality_of(attribute)
    return simple_matcher("model to validate numericality of #{attribute}") do |model|
      model.send("#{attribute}=", 'bogus')
      !model.valid? && model.errors.invalid?(attribute)
    end
  end
  
  def validate_associated(attribute, invalid_params = {})
    return simple_matcher("model to validate associated #{attribute}") do |model|
      model.send("build_#{attribute}", invalid_params)
      !model.valid? && model.errors.invalid?(attribute)
    end
  end
end

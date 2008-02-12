# Monkey patch SourceAnnotationExtractor to look for notes in RAILS_ROOT/spec
require 'source_annotation_extractor'

class SourceAnnotationExtractor
  def find_with_rspec_support
    find_without_rspec_support(%w[app lib spec test])
  end
  alias_method :find_without_rspec_support, :find
  alias_method :find, :find_with_rspec_support
end

require 'mustache'

class Version < Mustache

  attr_reader :version

  self.template_extension = "swift"

  def initialize(version)
    @version = version
  end

end

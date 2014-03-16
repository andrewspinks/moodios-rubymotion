  module SmartInit
  def initialize(*args)
    return super unless args[0].is_a?(Hash)
    args[0].each_pair do |k,v|
      send("#{k}=", v) if respond_to?("#{k}=")
    end
  end
end
module LogicModule
  def where(*conditions)
    validate_conditions(conditions)
    methods = get_methods
    filtered_methods = methods.select do |method|
      conditions.all? do |cond|
        cond.call(get_unbound_method method)
      end
    end
  end

  private

  def validate_conditions conditions
    raise ArgumentError.new 'Condiciones vacías' if conditions.empty?
  end

  def get_methods
    if is_a? Module
      self.instance_methods false
    else
      self.methods false
    end
  end

  def get_unbound_method method
    if is_a? Module
      self.instance_method method
    else
      self.method method
    end
  end

  
end





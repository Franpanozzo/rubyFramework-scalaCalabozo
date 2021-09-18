module Aspects

  def self.on(*objetos, &bloque)
    validate_arguments(*objetos,&bloque)
    objetos.each { |obj| obj.extend(LogicModule)}
  end

  private
  def self.validate_arguments(*objetos)
    raise ArgumentError.new "Origen vacío" if objetos.empty? or !block_given?
  end
  
  
#   def evaluar_tipo(objeto,&bloque)     #arriba un each a cada objeto que llame a evaluar_tipo
#     if(objeto.is_a?(Class))
#         objeto.class_eval(&bloque)
#     elseif(objeto.is_a?(Module))       #Hay type test pero esta seria la idea, se arreglaria redefiniendo los metodos
#         objeto.module_eval(&bloque)     #en las autoclases
#     else
#         objeto.instance_eval(&bloque)
#     end
#   end  
  
  
end

module LogicModule #cambio nombre para que no sea confuso
end








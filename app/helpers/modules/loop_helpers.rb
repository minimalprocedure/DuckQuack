# encoding: utf-8
################################################################################
## Initial developer: Massimo Maria Ghisalberti <massimo.ghisalberti@gmail.org>
## Date: 2016-12-18
## Company: Pragmas <contact.info@pragmas.org>
## Licence: Apache License Version 2.0, http://www.apache.org/licenses/
################################################################################

module LoopHelpers

  ##
  # Loop n times
  def repeat(n, &block)
    n.times.each { |number|
      block.call(number)
    }
  end

  def repeat_while(n, &block)
    n.times.take_while(&block)
  end
  
end

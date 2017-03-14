require "observer"

#Subject class for Observer Pattern
#Converse() causes the state change by waiting for the user reply
#and then notifying the observers.

class User
  include Observable

  def initialize(name)
    @name = name
  end

  def converse()
    #puts "Start talking!"
    user_String = gets()
    changed
    self.notify_observers(self, user_String)
    #puts changed
  end

end

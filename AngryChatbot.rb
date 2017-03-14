require "./Chatbot"
#Observer to User.
#A child to the ChatBot class because must start the conversation
#the same way as other bots.
class AngryChatbot < Chatbot
  attr_accessor :emotion

  def initialize()
    #use emotion to make it obvious who is talking in the chat_hash
    #Also to determine some possible responses.
    @emotion = "AngryBot: "
  end

  def getFileName()
    return "chatter_angry.txt"
  end

  def sayGreeting()
    puts "AngryBot: Why are we even talking?"
  end

end
  #Update method is getting called by notify_observers in Chatbot class.

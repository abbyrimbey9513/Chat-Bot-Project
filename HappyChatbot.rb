#Implements Chat and Observer Pattern
#Observer to User.
#A child to the ChatBot class because must start the conversation
#the same way as other bots.
require "./Chatbot"

class HappyChatbot < Chatbot
  attr_accessor :emotion

  def initialize()
    #use emotion to make it obvious who is talking in the chat_hash
    #Also to determine some possible responses.
    @emotion = "HappyBot: "
  end

  def getFileName()
    return "chatter_happy.txt"
  end

  def sayGreeting()
    puts "HappyBot: Hi buddy!"
  end
end
  #Update method is getting called by notify_observers in Chatbot class.

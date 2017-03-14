require "./Chatbot"
#Observer to user
#A child to the ChatBot class because must start the conversation
#the same way as other bots.

class DepressedChatbot < Chatbot
    attr_accessor :emotion
  def initialize()
    #use emotion to make it obvious who is talking in the chat_hash
    #Also to determine some possible responses.
    @emotion = "SadBot: "
  end

  def getFileName()
    return "chatter_sad.txt"
  end

  def sayGreeting()
    puts "SadBot: I have no friends, I am shocked you are even talking to someone as worthless as me."
  end
end

  #Update method is getting called by notify_observers in Chatbot class.

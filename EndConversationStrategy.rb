require "./Chatbot"
require "./Response"

#End the conversation strategy
#End the conversation the same way every time but determines the message by emotion
class EndConversationStrategy < Response
  def initialize(bot_emotion)
    @bot_emotion = bot_emotion
  end

  def generateResponse(user_String)
    case @bot_emotion
    when "HappyBot: "
      return "HappyBot: Bye bye for now! Hope to talk soon!"
    when "SadBot: "
      return "SadBot: I knew you wouldn't want to be friends with me."
    when "AngryBot: "
      return "AngryBot: I'm done wasting my time with you!"
    end
  end
end

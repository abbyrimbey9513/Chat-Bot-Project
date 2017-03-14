require "./Chatbot"
require "./Response"

#The strategy for a deflection question. Cycles through three deflection
#questions.
#Keeping the chat_hash in case later there is a new requirement to deflect.
class QuestionsStrategy < Response
  def initialize(chat_hash)
    @chat_hash = chat_hash
    @index = 0
  end

  def generateResponse(user_String)
      case @index
      when 0
          @index += 1
          return "I am wondering the same thing, #{user_String}"
      when 1
          @index += 1
          return "I will tell you if you tell me so, #{user_String}"
      when 2
          @index = 0
          return "I can't answer that but I think you should."
      end
    end
end

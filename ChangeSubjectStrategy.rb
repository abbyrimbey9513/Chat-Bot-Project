require "./Chatbot"
require "./Response"

#Change subject strategy
class ChangeSubjectStrategy < Response

  def initialize(chat_hash)
    @chat_Response_Hash = chat_hash
    @index = 0
  end

  #gets the response that go along with change subject key
  #When index reaches the end of the change subject value it resets to 0
  #otherwise index keeps increasing to use the next response of change subject.
  def generateResponse(userString)
    response_array = @chat_Response_Hash["change subject"]
    to_return = response_array[@index]
    if @index == response_array.length - 1
      @index = 0
    else
      @index += 1
    end
    return to_return
  end
end

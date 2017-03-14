#Abstract Temp Method class
#The ChatBot class contains your template method along with necessary abstract
#methods to read in the dictionary file, select a response strategy, and update
#when notified by the Observable subject

require "./User"
require "./Response"
require "./MatchStrategy"
require "./EndConversationStrategy"
require "./QuestionsStrategy"
require "./ChangeSubjectStrategy"

class Chatbot
  attr_accessor :chat_response_hash

  def initialize()
    raise NoMethodError
  end

  def enterChat(user) #template method
    @user = user
    @user.add_observer(self)
    file_string = getFileName()
    readFile(file_string)
    sayGreeting()
    setUpResponses()
  end

  def getFileName()
    raise NoMethodError
  end

  #reads in the file, then parses it line by line for ":" the phrase before the colon will be the key in the hash
  #the value in the hash will be the phrases which will be an array
  def readFile( file_String)
    @chat_response_hash = Hash.new()
    chat_File = IO.readlines(file_String)
    arr = Array.new()
    arr1 = Array.new()
    chat_File.each { |line|
      #puts line
      arr = line.split(":")
      if (arr[0].length != 1)
        @chat_response_hash[arr[0]] = arr[1]
      end
    }
  end


  #This is unique to the chatbot.
  def sayGreeting()
    raise NoMethodError
  end

  def setUpResponses()
    @change_response = ChangeSubjectStrategy.new(@chat_response_hash)
    @question_response = QuestionsStrategy.new(@chat_response_hash)
    @match_response = MatchStrategy.new(@chat_response_hash)
    @end_response = EndConversationStrategy.new(self.emotion)
  end

  #Check length of users string if == 1 call endConvo strategy
  #if > 1 check if a key from chatResponseHash is in userString if yes then matchStratgy
  #else if  no match but userString ends with ? then QuestionStratgey
  #else ChangeSubject strategy
  def update(chat_bot, user_string)
    #puts "In Update"
    using_match = false
    user_string = user_string.downcase
    #Even if the user string is a greeting of one word like "Hey", we end the
    #the conversation. It is assumed that the user will use more than one word
    #when responding to the bots.
    if(!user_string.include?(" "))
      #puts "END"
      puts @end_response.generateResponse(user_string)
      @user.delete_observer(self)
    else
      @chat_response_hash.each_key {|key|
        if (user_string.include?(key))
          using_match = true
          #puts "MATCH!"
          puts self.emotion + @match_response.generateResponse(user_string)
          break
        end
        }
      user_string.rstrip!
      if (!using_match && user_string.end_with?("?"))
          #puts"DEFLECTION QUESTION!"
          puts self.emotion + @question_response.generateResponse(user_string)
      elsif (!using_match && !user_string.end_with?("?"))
          #puts "CHANGE THE SUBJECT!"
          puts self.emotion + @change_response.generateResponse(user_string)
      end #End if/else
    end #end else
  end#end update()

end #End Class

require "./Chatbot"
require "./Response"

#Match strategy
class MatchStrategy < Response
  def initialize(chat_hash)
    @chat_Response_Hash = chat_hash
    splitResponses()
    @keys_Used = Array.new() #Used to determine what response should be for that
    #specific key.
  end

  #For every key value pair in the response hash, the value is made into an
    #array of strings. Each string being a different response for that key.
  def splitResponses()
    my_array = Array.new()
    @chat_Response_Hash.each {|key, value|
      my_array = value.split(";")
      my_array.delete_if {|i| i.length == 1}
      @chat_Response_Hash[key] = my_array
    }
  end

  #The strategy method.
  #Find the best key match based off of the string given from the user.
  #The longest key used is added to the keys_Used array.
  #Then a response is returned to be printed.
  #Note this goes by the length of the string.. so for example do you is length 6
  #while favorite is length 8 so the favorite responses will be used if the user
  #says something like "Do you have a favorite team?" 
  def generateResponse(user_String)
    longest_Key = " "
    @chat_Response_Hash.each_key { |key|
      if (user_String.include?(key) && key.length > longest_Key.length)
          longest_Key = key
      end
    }
    @keys_Used << longest_Key
    # I have found the longest key, now I am going to pick a response from the value
    #that corresponds.
    response_array = @chat_Response_Hash[longest_Key]
    index = findIndex(longest_Key, response_array.size)
    return response_array[index]
  end

  #Searches through the keys_Used array for how many times the longest keys has
  #occured. Returns that value.
  #If the number of times the longest key equals the length of the response
  #array then delete all occurrences of the longest key and start over.
  def findIndex(longest_key, response_array_length)
    num = @keys_Used.count(longest_key)
      if num == response_array_length
        @keys_Used.delete(longest_key)
      end
    return num - 1 #Since arrays are 0 based.
  end
end

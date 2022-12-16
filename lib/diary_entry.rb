class DiaryEntry
    
    def initialize(title, contents)
        fail "Please ensure your title and contents are string values" unless title.is_a? String
        fail "Please ensure your title and contents are string values" unless contents.is_a? String 
        fail "Your title / contents is empty" if title.empty?
        @title = title
        @contents = contents
    end

    def title
        return @title
    end

    def contents 
        return @contents
    end

    def count_words
        return 0 if contents.empty?
        @contents.count(" ") + 1
    end

    def reading_time(wpm) 
        fail "Please ensure wpm given is above 0!" unless wpm > 0
        reading_time = (count_words.to_f / wpm).ceil
        return reading_time
      end

    def phone_numbers(contacts) # instance of contacts class
        return contacts.phone_numbers
    end

end
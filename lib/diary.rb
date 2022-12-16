class Diary
    def initialize
        @diary = []
    end

    def add(entry)
        @diary << entry
    end

    def tasks(todo)
        return todo.tasks
    end

    def all
          fail "Zero diary entries have been added" if @diary.empty?
          return @diary
    end

    def count_words
        return @diary.sum(&:count_words)
    end
    
    def reading_time(wpm)
        fail "Please ensure wpm given is above 0!" unless wpm > 0
        reading_time = (count_words.to_f / wpm).ceil
        return reading_time
    end
    
    def find_best_entry_for_reading_time(wpm, minutes)
        readable_entries_list = @diary.select {|entry| 
            entry.reading_time(wpm) <= minutes
        }   
        return readable_entries_list.max_by(&:count_words)
    end
end
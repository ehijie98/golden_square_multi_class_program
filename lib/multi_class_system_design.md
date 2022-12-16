# Multi Class System Design Recipe

## 1. Describe the problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

- record entries in diary
- read past entries
- select past entries based on time available plus reading speed
- keep todo list alongside diary
- list phone numbers in all entries

Based on the user stories above - I will most likely need a 5-class system: 
 - Diary
 - DiaryEntries
 - TodoList
 - Todo
 - Contacts 

## 2. Design the Class System                                                                               
 ┌───────────────────────────────────────────────────┐                        
 │                                                   │                        ┌───────────────────────┐
 │   Diary                                           │                        │  Todo(task)           │
 │                                                   │                        │                       │
 │   - add(entry)                                    │                        │  - mark_done!         │
 │                                                   ├────────────────────────►                       │
 │   - all => [diary_entry_1, diary_entry_2..]       │                        │  - done?              │
 │                                                   │    owns a list of      │                       │
 │   - count_words                                   │                        │                       │
 │                                                   │                        └───────────────────────┘
 │   - reading_time (wpm)                            │
 │                                                   │
 │   - find_best_entry_for_reading_time(wpm, minutes)│
 │                                                   │
 │                                                   │
 └─────────────────────────┬─────────────────────────┘
                           │
                           │
                           │  owns a list of
                           │
  ┌────────────────────────▼────────────────────────────┐
  │  DiaryEntries(title, contents)                      │
  │                                                     │
  │  - count_words                                      │
  │                                                     │ 
  │  - reading_time (wpm)                               │
  │                                                     │
  │                                                     │
  └────────────────────────┬────────────────────────────┘
                           │
                           │  it contains a list of phone numbers
                           │
   ┌───────────────────────▼───────────────────┐
   │                                           │
   │ Contacts                                  │
   │                                           │
   │ - name                                    │
   │                                           │
   │ - phone numbers                           │
   └───────────────────────────────────────────┘
               
```ruby

class DiaryEntry

    def initialize(title, contents) # title, contents are strings
    # ...
    end

    def title
        # Returns the title as a string
    end

    def contents
        # Returns the contents as a string
    end

    def phone_numbers
        # Returns phone numbers list in Contacts
    end

    def count_words
        # Returns the number of words in the contents as an integer
    end

    def reading_time(wpm) # wpm is an integer representing
                            # the number of words the user can read per minute
        # Returns an integer representing an estimate of the reading time in minutes
        # for the contents at the given wpm.
    end

end

class Diary

    def initalize # takes zero arguments
        ... # initialize method creates empty list
    end

    def add(entry) # entry is an instance of DiaryEntries
            # adds entry to diary list
            # returns nothing
    end 

    def all # takes zero arguments
            # returns a list of DiaryEntries instances

    end

    def tasks(todo) # takes initialized Todo object as only arguments
            # returns list of todo
    end

    def count_words # takes zero arguments
                    # returns number of words in contents of entries within list
                    # uses same method in DiaryEntries
    end

    def reading_time(wpm) # takes integer value of wpm as only argument, representing reading speed
                          # in words per minute
                          # returns rounded up integer value of reading_time
    end

    def find_best_entry_for_reading_time(wpm, minutes) # takes integer values of wpm and minutes as
                                                       # two arguments
                                                       # returns entry with longest reading time that does not exceed wpm  # * minutes
    end
end



class Todo 
    
    def initialize  # takes zero arguments
                    # initialize method creates empty list
      # ...
    end
  
    def add(task) # takes task argument as string
                  # adds task to initialized list
                  # returns nothing
    end

    def tasks # takes zero arguments
              # returns all tasks as a list

    end
  
    def mark_done!  # takes zero arguments
                    # marks the todo as done
                    # returns nothing
    end
  
    def done?   # takes zero arguments
                # returns true if the task is done
                # otherwise, false
    end
end

 
class Contact
    
    def initialize() # takes zero arguments
                     # returns empty hash
    end

    def add (name, phone_number) # takes two string arguments name and phone_number
                                 # updates hash with new contacts
                                 # returns nothing
    end

    def name # takes zero arguments
             # returns list of all names in contacts
    end

    def phone_numbers # takes zero arguments
                     # returns list of all phone numbers        
    end

    def all # takes zero arguments
            # returns hash with all contact names and phone numbers
    end

    def delete(name) # takes one string argument
                     # removes name and phone number from contacts hash
    end
end


```




``` ruby
# 1
diary = Diary.new
contacts = Contacts.new
contacts.add("John", "123")
contacts.add("Luke", "456")
diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
diary_entry_2 = DiaryEntry.new("title_2", "contents_2")
diary_entry_1.phone_number 
# => ["123", "456"]

# 2
diary = Diary.new
contacts = Contacts.new
contacts.add("John", "123")
contacts.add("Luke", "456")
diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
diary_entry_2 = DiaryEntry.new("title_2", "contents_2")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
todo = Todo.new
todo.add = Todo.new("wash dishes", "tidy room")
diary_entry_1.todo => ["wash dishes", "tidy room"]

```
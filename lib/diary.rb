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
end
class Todo
    def initialize
        @todo_list = []
    end

    def add(task)
        fail "Please enter a string value for task" unless task.is_a? String
        fail "Please enter a task" if task == ""
        @todo_list << task
    end

    def tasks
        return @todo_list
    end
end
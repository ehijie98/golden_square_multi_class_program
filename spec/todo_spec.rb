require 'todo'

RSpec.describe Todo do
    it "initially" do
        todo = Todo.new
    end

    describe "#add" do
        context "adds two correctly formatted" do
            it "returns list of all tasks" do
                todo = Todo.new
                todo.add("wash dishes")
                todo.add("tidy room")
                    expect(todo.tasks).to eq ["wash dishes", "tidy room"]
            end
        end

        context "adds a non-string task" do
            it "fails" do
                todo = Todo.new
                expect{todo.add(true)}.to raise_error "Please enter a string value for task"
            end
        end

        context "adds an empty string" do
            it "fails" do
                todo = Todo.new
                expect{todo.add("")}.to raise_error "Please enter a task"
            end
        end
    end
end
require 'contact'
require 'diary'
require 'diary_entry'
require 'todo'

RSpec.describe " Multi Class System Integration" do
    context "tests relationship between Diary, Contacts and DiaryEntry classes" do
        it "it returns list of phone numbers" do
            diary = Diary.new
            contacts = Contacts.new
            contacts.add("John", "123")
            contacts.add("Luke", "456")
            diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
            diary_entry_2 = DiaryEntry.new("title_2", "contents_2")
            numbers = diary_entry_1.phone_numbers(contacts)
                expect(numbers).to eq ["123", "456"]
        end
    end

    context "tests relationship between all four classes within system" do
        it "returns todo list via DiaryEntry instantiated object" do
        diary = Diary.new
        contacts = Contacts.new
        contacts.add("John", "123")
        contacts.add("Luke", "456")
        diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
        diary_entry_2 = DiaryEntry.new("title_2", "contents_2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        todo = Todo.new
        todo.add("wash dishes") 
        todo.add("tidy room")
        list = diary.tasks(todo)
            expect(list).to eq ["wash dishes", "tidy room"]
        end
    end

    
end
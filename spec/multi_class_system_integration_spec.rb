require 'contact'
require 'diary'
require 'diary_entry'
require 'todo'

RSpec.describe " Multi Class System Integration" do
    context "tests relationship between Diary, Contacts and DiaryEntry classes" do
        it "it returns list of phone numbers" do
            diary = Diary.new
            contacts = Contacts.new
            contacts.add("John", 123)
            contacts.add("Luke", 456)
            diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
            diary_entry_2 = DiaryEntry.new("title_2", "contents_2")
            numbers = diary_entry_1.phone_numbers(contacts)
                expect(numbers).to eq [123, 456]
        end
    end

    context "tests relationship between all four classes within system" do
        it "returns todo list via DiaryEntry instantiated object" do
        diary = Diary.new
        contacts = Contacts.new
        contacts.add("John", 123)
        contacts.add("Luke", 456)
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

    context "testing Diary and DiaryEntry relationship" do
        it "returns all instantiated entries added to Diary" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
            diary_entry_2 = DiaryEntry.new("title_2", "contents_2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            list = diary.all
                expect(list).to eq [diary_entry_1, diary_entry_2]
        end
    end

    context "adds zero diary entries into diary" do
        it "fails" do
            diary = Diary.new
            expect{diary.all}.to raise_error "Zero diary entries have been added"
        end
    end


    describe "word counting behaviour" do
        it "returns correct number of words in contents of all diary entries'" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("title_1", "one two three")
            diary_entry_2 = DiaryEntry.new("title_2", "one two three four")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            count = diary.count_words
                expect(count).to eq 7
        end
    end

        it "returns zero when contents is zero" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("title_1", "")
            diary_entry_2 = DiaryEntry.new("title_2", "")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            count = diary.count_words
                expect(count).to eq 0
        end

    describe "reading time behaviour" do
        context "given a feasible wpm" do
            it "returns ceiling integer representing minutes taken to read all contents" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("title_1", "one two three")
                diary_entry_2 = DiaryEntry.new("title_2", "one two three four")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                time = diary.reading_time(3) 
                    expect(time).to eq 3
            end
        end

        context "given a wpm of zero" do
            it "fails" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("title_1", "one two three")
                diary_entry_2 = DiaryEntry.new("title_2", "one two three four")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                    expect{diary.reading_time(0)}.to raise_error "Please ensure wpm given is above 0!"
            end
        end
    end
end
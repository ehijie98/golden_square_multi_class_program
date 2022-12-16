require 'diary_entry'

RSpec.describe DiaryEntry do 
    context "initializes using both string title and string contents" do
        it "initially" do
            diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
                expect(diary_entry_1.title).to eq "title_1"
                expect(diary_entry_1.contents).to eq "contents_1"
        end
    end

    context "initializes using string title and non-string contents" do
        it "fails" do
            expect{DiaryEntry.new("title_1", true)}.to raise_error "Please ensure your title and contents are string values"
        end
    end

    context "initializes using non-string title and string contents" do
        it "fails" do
            expect{DiaryEntry.new(true, "contents_1")}.to raise_error "Please ensure your title and contents are string values"
        end
    end

    context "initializes using empty string title and contents" do
        it "fails" do
            expect{DiaryEntry.new("", "")}.to raise_error "Your title / contents is empty"
        end
    end

    describe "#count_words" do
        it "returns number of words of contents as an integer" do
        diary_entry = DiaryEntry.new("diary_title", "took a nap")
            expect(diary_entry.count_words).to eq 3
        end

        it "returns zero when contents is empty" do
        diary_entry = DiaryEntry.new("diary_title", "")
            expect(diary_entry.count_words).to eq 0
        end
    end

    describe "#reading_time" do
        context "given a feasible wpm" do
            it "returns ceiling integer representing minutes taken to read contents" do
                diary_entry = DiaryEntry.new("diary_title", "one two three")
                    expect(diary_entry.reading_time(3)).to eq 1

                diary_entry = DiaryEntry.new("diary_title", "one two")
                    expect(diary_entry.reading_time(1)).to eq 2
          
                diary_entry = DiaryEntry.new("diary_title", "one two three four five")
                    expect(diary_entry.reading_time(3)).to eq 2
            end
        end

        context "given a wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("diary_title", "diary_contents")
                    expect{diary_entry.reading_time(0)}.to raise_error "Please ensure wpm given is above 0!"
            end
        end
    end
end
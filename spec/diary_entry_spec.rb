require 'diary_entry'

RSpec.describe DiaryEntry do 
    it "initially" do
        diary_entry_1 = DiaryEntry.new("title_1", "contents_1")
        diary_entry_2 = DiaryEntry.new("title_1", "contents_2")
    end
end
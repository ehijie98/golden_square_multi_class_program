require 'contact'

RSpec.describe Contacts do
    it "initially" do
        contacts = Contacts.new
    end

    describe "#add" do
        context "two contacts are added to hash" do
            it "adds successfully without error" do
                contacts = Contacts.new
                contacts.add("John", "123")
                contacts.add("Luke", "456")
            end
        end
    end

    describe "#phone_number" do
        it "returns list of phone numbers" do
            contacts = Contacts.new
            contacts.add("John", "123")
            contacts.add("Luke", "456")
            list = contacts.phone_numbers
                expect(list).to eq ["123", "456"]
        end
    end
end
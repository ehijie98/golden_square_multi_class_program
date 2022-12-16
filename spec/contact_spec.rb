require 'contact'

RSpec.describe Contacts do
    it "initially" do
        contacts = Contacts.new
    end

    describe "#add" do
        context "two contacts are added to hash" do
            it "adds successfully without error" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
            end
        end

        context "an invalid name is added to hash" do
            it "fails" do
                contacts = Contacts.new
                expect{contacts.add(true, 123)}.to raise_error "Please ensure name is a string"
            end
        end

        context "an invalid number is added to hash" do
            it "fails" do
                contacts = Contacts.new
                expect{contacts.add("John", "123")}.to raise_error "The number you have given is invalid"
            end
        end
    end

    describe "#phone_numbers" do
        it "returns list of phone numbers" do
            contacts = Contacts.new
            contacts.add("John", 123)
            contacts.add("Luke", 456)
            list = contacts.phone_numbers
                expect(list).to eq [123, 456]
        end
    end

    describe "phone_number_for" do
        context "valid name is given" do
            it "returns phone number for given name" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                number = contacts.phone_number_for("John")
                    expect(number).to eq 123
            end
        end

        context "invalid name is given" do
            it "fails" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                    expect{ contacts.phone_number_for("Colin") }.to raise_error "The name you have given is not in your phonebook"
            end
        end
    end

    describe "#delete" do
        context "valid name is given to delete alongside phone number" do
            it "removes name + phone number from hash" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                contacts.delete("John")
                    expect(contacts.name).to eq ["Luke"]
            end
        end

        context "invalid name is given to delete" do
            it "fails" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                    expect {contacts.delete("Colin")}.to raise_error "The name you have given is not in your phonebook"
            end
        end
    end

    describe "#update" do
        context "valid name and phone number are given" do
            it "updates name with new phone number" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                contacts.update("John", 789)
                number = contacts.phone_number_for("John")
                    expect(number).to eq 789
            end
        end

        context "invalid name is given" do
            it "fails" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                    expect{contacts.update("Colin", 789)}.to raise_error "The name you have given is not in your phonebook"
            end
        end
        
        context "invalid number is given" do
            it "fails" do
                contacts = Contacts.new
                contacts.add("John", 123)
                contacts.add("Luke", 456)
                    expect{contacts.update("John", "789")}.to raise_error "The number you have given is invalid"
            end
        end
    end
end
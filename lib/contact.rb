class Contacts
   
    def initialize
        @contacts = {}
    end

    def add(name, phone_number)
        @contacts[name] = {"number" => phone_number}
    end

    def name
        @contacts.keys
    end

    def phone_number_for(name)
       @contacts[name]["number"]
    end

    def phone_numbers
        @contacts
        phone_numbers_list = @contacts.map do |key, value| value["number"]
        end
        return phone_numbers_list
    end
    def delete(name)
        @contacts.delete(name)
    end
    
end
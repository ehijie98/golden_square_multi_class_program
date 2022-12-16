class Contacts
   
    def initialize
        @contacts = {}
    end

    def add(name, phone_number)
        fail "Please ensure name is a string" unless name.is_a? String
        fail "The number you have given is invalid" unless phone_number.is_a? Integer
        @contacts[name] = {"number" => phone_number}
    end

    def name
        @contacts.keys
    end

    def phone_numbers
        phone_numbers_list = @contacts.map do |key, value| value["number"]
        end
        return phone_numbers_list
    end

    def phone_number_for(name)
        fail "The name you have given is not in your phonebook" unless @contacts.keys.include?(name)
        @contacts[name]["number"]
    end
    
    def delete(name)
        fail "The name you have given is not in your phonebook" unless @contacts.keys.include?(name)
        @contacts.delete(name)
    end

    def update(name, phone_number)
        fail "The name you have given is not in your phonebook" unless @contacts.keys.include?(name)
        fail "The number you have given is invalid" unless phone_number.is_a? Integer
        @contacts[name] = {"number" => phone_number}
    end
end
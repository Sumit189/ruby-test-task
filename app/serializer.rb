class Serializer
    @@obj_attributes ||= {}
    @@obj ||= []
  
    def initialize(val)
        @@obj = val
        # p @@obj_attributes[self.class]
        @serialize_hash = @@obj_attributes[self.class]
        @serialize_hash.each do |key, value|
            if value
                @serialize_hash[key] = value.call()
            else
                @serialize_hash[key] = @@obj[key]
            end
        end
    end

    def serialize
        @serialize_hash
    end
  
    def self.object
        @@obj
    end
  
    def self.attribute(value, &block)
        @@obj_attributes[self] ||= {}
        if block_given?
            @@obj_attributes[self][value] = block
        else
            @@obj_attributes[self][value] = nil
        end 
        # p "#{@@obj_attributes[self]}"
    end
end

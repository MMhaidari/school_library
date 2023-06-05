class Person
    attr_accessor id, name, age

    def initialize(id, name: "Unknown" , age, parent_permission: true)
        @id = rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    private def of_age?
        if @age >= 18
            true
        else
            false
        end
    end

    private def ca_use_services?
        if @parent_permission == true || of_age? == true
            true
        else
            false
        end
    end
end
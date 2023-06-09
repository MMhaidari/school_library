class Person
  attr_accessor :id, :name, :age, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @parent_permission || of_age?
  end
end

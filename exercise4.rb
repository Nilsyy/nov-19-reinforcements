class Vampire

  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.coven
    return @@coven
  end

  def self.coven_names
    output = []
    for vampire in @@coven
      output << vampire.name
    end
    return output
  end

  def name
    return @name
  end

  #Reader
  def in_coffin
    @in_coffin
  end

  #Writer
  def in_coffin=(bool)
    @in_coffin = bool
  end

  #Reader
  def drank_blood_today
    @drank_blood_today
  end

  #Writer
  def drank_blood_today=(bool)
    @drank_blood_today = bool
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def self.sunrise
    @@coven.each do |vampire|
      if vampire.in_coffin == false || vampire.drank_blood_today == false
        @@coven.delete(vampire)
      end
    end
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
    end
  end

  def go_home
    @in_coffin = true
  end
end

sofia = Vampire.create("Sofia", 4124213)
sanna = Vampire.create("Sanna", 15155215)
tom = Vampire.create("Tom", 2155121)
kozue = Vampire.create("Kozue", 15515)

puts sofia.inspect
puts sanna.inspect
Vampire.sunset
sofia.drink_blood
sanna.drink_blood
kozue.drink_blood
sofia.go_home
sanna.go_home
tom.go_home
Vampire.sunrise

puts "Vampires who returned to the coven at the end of the day: #{Vampire.coven_names}."

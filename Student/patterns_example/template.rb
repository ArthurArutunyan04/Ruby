class CaffeineBeverage
  def prepare_recipe
    boil_water
    brew
    pour_in_cup
    add_condiments
  end

  private

  def boil_water
    puts "Кипятить воду"
  end

  def pour_in_cup
    puts "Налить в чашку"
  end

  def brew
  end

  def add_condiments
  end
end

class Double_espresso < CaffeineBeverage
  def brew
    puts "Заварить двойную порцию эспрессо"
  end

  def add_condiments
    puts "Ничего не добавлять"
  end
end


class Americano < CaffeineBeverage
  def brew
    puts "Заварить эспрессо"
  end

  def add_condiments
    puts "Добавить горячую воду"
  end
end

espresso = Double_espresso.new
espresso.prepare_recipe

puts "-" * 20

americano = Americano.new
americano.prepare_recipe

module ApplicationHelper
  def target_price #対象金額
    if @price.category_id == 1 or @price.category_id == 4 
      return @price.free_price
    elsif @price.category_id == 3 && @price.age < 3 && @price.free_price <= 42000
      return @price.free_price
    elsif @price.category_id == 3 && @price.age < 3 && @price.free_price > 42000
      return 42000
    elsif @price.category_id == 3 && @price.age >= 3 && @price.free_price <= 37000
      return @price.free_price
    elsif @price.category_id == 3 && @price.age >= 3 && @price.free_price > 37000
      return 37000
    elsif @price.category_id == 2 && @price.age ==  0 && @price.free_price <= 37100
      return @price.free_price
    elsif @price.category_id == 2 && @price.age ==  0 && @price.free_price > 37100
      return 37100
    elsif @price.category_id == 2 && @price.age ==  1 || 2 && @price.free_price <= 37000
      return @price.free_price
    elsif @price.category_id == 2 && @price.age ==  1 || 2 && @price.free_price > 37000
      return 37000
    elsif @price.category_id == 2 && @price.age ==  3 && @price.free_price <= 26600
      return @price.free_price
    elsif @price.category_id == 2 && @price.age ==  3 && @price.free_price > 26600
      return 26600
    elsif @price.category_id == 2 && @price.age > 3 && @price.free_price <= 23100
      return @price.free_price
    elsif @price.category_id == 2 && @price.age > 3 && @price.free_price > 23100
      return 23100
    end
  end

  def max_price ##上限残り金額
    if @price.category_id != 3
      return  "他の施設を無償化対象としての併用はできません。"
    elsif @price.category_id == 3 && @price.age < 3 && target_price <= 42000
      return "#{42000 - target_price}円"
    elsif @price.category_id == 3 && @price.age < 3 && target_price > 42000
      return "0円"
    elsif @price.category_id == 3 && @price.age >= 3 && target_price <= 37000
      return "#{37000 - target_price}円"
    elsif @price.category_id == 3 && @price.age >= 3 && target_price > 37000
      return  "0円"
    end
  end
end

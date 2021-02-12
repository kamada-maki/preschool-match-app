module ApplicationHelper
  def target_price # 対象金額
    if (@price.category_id == 1) || (@price.category_id == 4)
      @price.free_price
    elsif @price.category_id == 3 && @price.age_id < 3 && @price.free_price <= 42_000
      @price.free_price
    elsif @price.category_id == 3 && @price.age_id < 3 && @price.free_price > 42_000
      42_000
    elsif @price.category_id == 3 && @price.age_id >= 3 && @price.free_price <= 37_000
      @price.free_price
    elsif @price.category_id == 3 && @price.age_id >= 3 && @price.free_price > 37_000
      37_000
    elsif @price.category_id == 2 && @price.age_id ==  0 && @price.free_price <= 37_100
      @price.free_price
    elsif @price.category_id == 2 && @price.age_id ==  0 && @price.free_price > 37_100
      37_100
    elsif @price.category_id == 2 && @price.age_id ==  2 && @price.free_price <= 37_000
      @price.free_price
    elsif @price.category_id == 2 && @price.age_id ==  2 && @price.free_price > 37_000
      37_000
    elsif @price.category_id == 2 && @price.age_id ==  3 && @price.free_price <= 26_600
      @price.free_price
    elsif @price.category_id == 2 && @price.age_id ==  3 && @price.free_price > 26_600
      26_600
    elsif @price.category_id == 2 && @price.age_id ==  4 && @price.free_price <= 23_100
      @price.free_price
    elsif @price.category_id == 2 && @price.age_id == 4 && @price.free_price > 23_100
      23_100
    end
  end
  def max_price # #上限残り金額
    if @price.category_id != 3
      '他の施設を無償化対象としての併用はできません。'
    elsif @price.category_id == 3 && @price.age_id < 3 && target_price <= 42_000
      "#{42_000 - target_price}円"
    elsif @price.category_id == 3 && @price.age_id < 3 && target_price > 42_000
      '0円'
    elsif @price.category_id == 3 && @price.age_id >= 3 && target_price <= 37_000
      "#{37_000 - target_price}円"
    elsif @price.category_id == 3 && @price.age_id >= 3 && target_price > 37_000
      '0円'
    end
  end
end

class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(set_obj)
    return true if set.size.zero?
    array = set_obj.set.each_cons(set.size).to_a
    array.any? do |arr|
      set == arr
    end
  end

  def disjoint?(set_obj)
    set.none? do |num|
      set_obj.set.include?(num)
    end
  end

  def eql?(set_obj)
    set.uniq.sort == set_obj.set.uniq.sort
  end

  def ==(other)
    set.eql?(other.set)
  end

  def add(num)
    @set << num unless contains?(num)
    self
  end

  def intersection(set_obj)
    new_set = set.select do |num|
      set_obj.set.include?(num)
    end
    CustomSet.new(new_set)
  end

  def difference(set_obj)
    new_set = set - set_obj.set
    CustomSet.new(new_set)
  end

  def union(set_obj)
    new_set = set + set_obj.set
    CustomSet.new(new_set.uniq.sort)
  end
end

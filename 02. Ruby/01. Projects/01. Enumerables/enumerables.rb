class Array
  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    my_each do |ele|
      new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    my_each do |ele|
      new_arr << ele unless prc.call(ele)
    end
    new_arr
  end

  def my_any?(&prc)
    my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    my_each do |ele|
      return false unless prc.call(ele)
    end
    true
  end

  def my_flatten
    new_arr = []
    my_each do |ele|
      if ele.is_a?(Array)
        new_arr += ele.my_flatten
      else
        new_arr << ele
      end
    end
    new_arr
  end

  def my_zip(*args)
    new_arr = []
    i = 0
    while i < length
      sub_arr = []
      sub_arr << self[i]
      args.my_each do |ele|
        sub_arr << ele[i]
      end
      new_arr << sub_arr
      i += 1
    end
    new_arr
  end

  def my_rotate(num = 1)
    new_arr = dup
    if num.positive?
      num.times do
        new_arr.push(new_arr.shift)
      end
    else
      num.abs.times do
        new_arr.unshift(new_arr.pop)
      end
    end
    new_arr
  end

  def my_join(str = '')
    new_str = ''
    my_each do |ele|
      new_str += ele
      new_str += str unless ele == last
    end
    new_str
  end

  def my_reverse
    new_arr = []
    my_each do |ele|
      new_arr.unshift(ele)
    end
    new_arr
  end
end

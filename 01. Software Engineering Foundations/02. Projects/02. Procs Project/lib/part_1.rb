def my_map(arr, &prc)
  arr.each_with_object([]) do |el, acc|
    acc << prc.call(el)
  end
end

def my_select(arr, &prc)
  arr.each_with_object([]) do |el, acc|
    acc << el if prc.call(el)
  end
end

def my_count(arr, &prc)
  my_select(arr, &prc).length
end

def my_any?(arr, &prc)
  my_count(arr, &prc).positive?
end

def my_all?(arr, &prc)
  my_count(arr, &prc) == arr.length
end

def my_none?(arr, &prc)
  my_count(arr, &prc).zero?
end

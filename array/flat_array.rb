def flatten_ar(items)
  return [items] unless items.is_a?(Array)
  out = []
  items.each do |item|
    out += flatten_ar(item)
  end
  out
end

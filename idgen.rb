def generate_id
  s = "0123456789abcdef".chars
  return (1..8).map {|_| s.sample}.join("")
end


def las_req(chars, memo = '')
  items = chars.take_while { |c| c == chars[0] }
  if items.empty?
    memo
  else
    memo += "#{items.size}#{items[0]}"
    las_req(chars.drop(items.size), memo)
  end
end

def las1(chars)
  memo = [chars[0]]
  result = ''
  chars.drop(1).each { |c|
    if memo[0] == c
      memo << c
    else
      result += "#{memo.size}#{memo[0]}"
      memo = [c]
    end
  }
  result += "#{memo.size}#{memo[0]}"
end

def las_seq_req(base, loop = 20)
  [base] + loop.times.map {
    base = las_req(base.to_s.chars)
  }
end

def las_seq1(base, loop = 20)
  [base] + loop.times.map {
    base = las1(base.to_s.chars)
  }
end

def las_seq2(base, loop = 20)
  [base] + loop.times.map {
    base = las2(base.to_s.chars)
  }
end


benchmark { puts las_seq_req(1) }

benchmark { puts las_seq1(1) }

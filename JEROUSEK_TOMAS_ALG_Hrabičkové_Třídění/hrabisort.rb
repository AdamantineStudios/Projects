class Array
  def hrabisort!(ktype = 1)
    steps = []
    case ktype
      when 1
        length.times do |i|
          break if length <= 2**(i+1)
          steps << (length / 2.0**(i+1)).floor
        end
      when 2
        length.times do |i|
          break if (3**(i+1)-1) / 2.0 > (length / 3.0).ceil
          steps << ((3**(i+1)-1) / 2)
        end
      when 3
        l = p = 0
        until (3**l) * (2**p) > length
          steps << (3**l) * (2**p)
          l += 1
          if (3**l) * (2**p) > length
            l = 0
            p += 1
          end
        end
        steps.sort!
    end
    steps.reverse!

    steps.each do |step|
      step.times do |i|
        position = step + i
        length.times do |k|
          next_step = position + (step * k)
          break if next_step >= length
          exp = self[next_step]
          exp_position = next_step
          (k+1).times do |f|
            sub = (next_step) - (step * (f+1))
            if exp < self[sub]
              self[sub + step] = self[sub]
              exp_position = sub
            end
          end
          self[exp_position] = exp unless self[exp_position] == exp
        end
      end
    end
    return self
  end
end


a = [1, 2, 5, 10, 1, 3, 4, 6, 7, 200, 3, 10, 12, 18, 0, 500, 477, 301, 60, 101, 1001, 53].hrabisort!
p a
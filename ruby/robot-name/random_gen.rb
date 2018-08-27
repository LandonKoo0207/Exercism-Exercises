def new_name
  # (Array.new(2){[*'A'..'Z'].sample} + Array.new(3){[*'0'..'9'].sample}).join
  Array.new(1){[*'A'..'Z'].sample *2}.flatten.join + Array.new(1){[*'0'..'9'].sample *3}.flatten.join
end

def running_time
  begin_time = Time.now
  @@robots.bsearch {|x| x=='AA000'}
  exe_time = Time.now - begin_time
  puts "Time: #{exe_time}"
end

all_names_count = 26 * 26 * 1000
seen_names = Hash.new(0)
robots = []
while seen_names.size < 1000
  robot = Robot.new
  seen_names[robot.name] += 1
  robots << robot
end

#(Array.new(2){[*'A'..'Z'].sample} + Array.new(3){[*'0'..'9'].sample}).join
('AA'..'ZZ').to_a.sample + ('000'..'999').to_a.sample

N = 26 * 26 * 1000

def gen(n)
  h = {}
  b = (0...N).to_a
  top = N
  n.times.with_object([]) do |i, a|
    rn = rand(top)
    a << nbr_to_str(b[rn])
    b[rn] = b[top-1]
    top -= 1
    h[a.last] = 0
  end
  h
end

def nbr_to_str(n)
  n, d = n.divmod(1000)
  n, s = n.divmod(26)
  "#{nbr_to_chr n}#{nbr_to_chr s}#{'%03d' % d}"
end

def nbr_to_chr(n)
  n < 26 ? (65+n).chr : (71+n.chr)
end
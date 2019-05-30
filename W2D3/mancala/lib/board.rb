require 'byebug'

class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { [] }
    place_stones
  end


#       12  11  10  9  8  7
# [store2]            [store1]
#      1   2   3  4  5  6

  # helper method to #initialize every non-store cup with four stones each
  def place_stones
    # debugger
    until cups[-2].count == 4
      cups.each_with_index do |cup, i|
        unless i == 6 || i == 13
          cups[i] << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (0..5).cover?(start_pos) || (7..12).cover?(start_pos)
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)#[1]
    stones = @cups[start_pos]
    @cups[start_pos] = []
     
    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx == 14
      if idx == 6
        cups[6] << stones.shift if current_player_name == name1
      elsif idx == 13
        cups[13] << stones.shift if current_player_name == name2
      else
        cups[idx] << stones.shift
      end
    end
    render
    next_turn(idx)

  end

  # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |bucket| bucket.empty? } || cups[7..12].all? { |bucket| bucket.empty? }
  end

  def winner
    return :draw if cups[6].count == cups[13].count
    cups[6].count > cups[13].count ? "#{name1}" : "#{name2}"
  end
end

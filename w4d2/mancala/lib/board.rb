class Board
    attr_accessor :cups

    def initialize(name1, name2)
        @name1 = name1
        @name2 = name2
        @cups = Array.new(14) { Array.new }
        self.place_stones
    end

    def place_stones
        @cups.each_with_index do |cup, idx|
        next if idx == 6 || idx == 13
            4.times do
            cup << :stone
        end
    end
        # @cups.each_with_index do |cup, i|
        #     if i == 6 || i == 13
        #         cup << :stone until cup.length == 4
        #     end
        # end
    end

    def valid_move?(start_pos)
        raise "Invalid starting cup." unless (0...12).to_a.include?(start_pos)
        raise "Starting cup is empty" if @cups[start_pos].empty?
    end

    def make_move(start_pos, current_player_name)
        stones = @cups[start_pos]
        @cups[start_pos] = []
        i = start_pos
    
        until stones.empty?
            i += 1
            i = 0 if i > 13

            if i == 6
                @cups[6] << stones.pop if current_player_name == @name1
            elsif i == 13
                @cups[13] << stones.pop if current_player_name == @name2
            else
                @cups[i] << stones.pop
            end
        end

        self.render
        next_turn[i]
    end

    def next_turn(ending_cup_idx)
        if ending_cup_idx == 6 || ending_cup_idx == 13
            :prompt
        elsif @cups[ending_cup_idx].length == 1
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
        @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
    end

    def winner
        @cups[6].length == @cups[13].length ? :draw : ( @cups[6].length > @cups[13].length ? @name1 : @name2 )
    end
end
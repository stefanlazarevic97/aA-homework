class Simon
    COLORS = %w(red blue green yellow)

    attr_accessor :sequence_length, :game_over, :seq

    def initialize
        @sequence_length = 1
        @game_over = false
        @seq = []
    end

    def play
        until @game_over
            take_turn
            system("clear")
        end

        game_over_message
        reset_game
    end

    def take_turn
        show_sequence
        require_sequence

        unless @game_over
            round_success_message
            @sequence_length += 1
        end
    end

    def show_sequence
        add_random_color
        
        @seq.each do |color| # taken from solution so I can try playing the game
            puts color
            sleep 0.75
            system("clear")
            sleep 0.25
        end
    end

    def require_sequence
        puts "Repeat the sequence by entering the first letter of each color on a new line." # taken from solution

        @seq.each do |color|
            unless color[0] == user_color
                @game_over = true
                break
            end
        end

        sleep 0.25 # taken from solution
    end

    def add_random_color
        @seq << COLORS.sample
    end

    def round_success_message
        "Good job! Next round:"
    end

    def game_over_message
        puts "Game over! Your score was #{@sequence_length - 1}."
    end

    def reset_game
        @sequence_length = 1
        @game_over = false
        @seq = []
    end
end
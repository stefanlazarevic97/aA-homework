class Array 
    def merge_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        return self if self.length <= 1
        center = self.length / 2
        sorted_left = self[0...center].merge_sort(&prc)
        sorted_right = self[center..-1].merge_sort(&prc)
        Array.merge(sorted_left, sorted_right, &prc)
    end
    
    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            if prc.call(left.first, right.first) == 1
                merged << right.shift
            else
                merged << left.shift
            end
        end
        
        merged + left + right
    end
end

def sluggish_octopus(fish_array)
    fish_array.each do |fish_1|
        longest_fish = true

        fish_array.each { |fish_2| longest_fish = false if fish_2.length > fish_1.length }
        
        return fish_1 if longest_fish
    end
end

def dominant_octopus(fish_array)
    prc = Proc.new { |a, b| a.length <=> b.length }
    fish_array.merge_sort(&prc).last
end

def clever_octopus(fish_array)
    longest_fish = fish_array.first
    fish_array.each { |fish| longest_fish = fish if fish.length > longest_fish.length }
    longest_fish
end

# fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# p sluggish_octopus(fish) # expecting "fiiiissshhhhhh"
# p dominant_octopus(fish) # expecting "fiiiissshhhhhh"
# p clever_octopus(fish) # expecting "fiiiissshhhhhh"

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index { |tile, i| return i if tile == direction }
end

tiles_hash = { "up" => 0, "right-up" => 1, "right"=> 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end

# p slow_dance("up", tiles_array) # expecting 0
# p slow_dance("right-down", tiles_array) # expecting 3
# p fast_dance("up", tiles_hash) # expecting 0
# p fast_dance("right-down", tiles_hash) # expecting 3


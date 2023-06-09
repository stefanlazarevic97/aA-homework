class Map
    def initialize
        @map_array = []
    end

    attr_reader :map_array
#little lost here, had to use the solutions

    def set(k, v)
        i = @map_array.index { |pair| pair[0] == k }
        i ? @map_array[i][1] = v : @map_array.push([k, v])
        v
    end

    def get(k)
        @map_array.each { |pair| return pair[1] if pair.first == k }
        nil
    end

    def delete(k)
        v = self.get(k)
        @map_array.reject! { |pair| pair.first == key }
        v
    end
    
    def show

    end
end
        
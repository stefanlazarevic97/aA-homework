class LRUCachu
    def initialize(size)
        @size = size
        @cache = Array.new
    end

    def count
        @cache.length
    end

    def add(ele)
        if @cache.include?(ele)
            @cache.delete(ele)
            @cache << ele
        elsif count >= @size
            @cache.shift
            @cache << ele
        else
            @cache << ele
        end
    end

    def show
        p @cache
    end
end
class Queue
    def initialize
        @queue_array = []
    end

    attr_reader :@queue_array

    def enqueue(ele)
        @queue_array.push(ele)
        return ele
    end

    def dequeue
        @queue_array.shift
    end

    def peek 
        @queue_array[0]
    end
end

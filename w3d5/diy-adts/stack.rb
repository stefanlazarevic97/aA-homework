class Stack
    def initialize = []
        @stack_array = []
    end

    attr_reader :stack_

    def push(ele)
        @stack_.push(ele)
    end

    def pop
        @stack_.pop
    end

    def peek
        @stack_[-1]
    end
end
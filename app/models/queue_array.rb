class QueueArray
  extend Forwardable

  def initialize
    @q = []
  end

  def_delegator :@q, :push, :enq
  def_delegator :@q, :shift, :deq

  def_delegators :@q, :clear, :first, :push, :shift, :size, :pop, :empty?
end

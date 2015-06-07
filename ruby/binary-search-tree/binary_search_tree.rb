class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(data)
    if data > self.data
      @right ? @right.insert(data) : @right = Bst.new(data)
    else
      @left ? @left.insert(data) : @left = Bst.new(data)
    end
  end

  def each(&block)
    return enum_for(:each) unless block
    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end
end

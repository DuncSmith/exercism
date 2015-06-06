module ArrayExtensions
  def keep
    return enum_for(:keep) unless block_given?
    a = []
    each { |e| a << e if yield(e) }
    a
  end
  
  def discard
    return enum_for(:discard) unless block_given?
    a = []
    each { |e| a << e unless yield(e) }
    a
  end
end

Array.include ArrayExtensions

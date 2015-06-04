module ArrayExtension
  def accumulate
    return enum_for(:accumulate) unless block_given?
    acc = []
    each { |e| acc << yield(e) }
    acc
  end
end

Array.send :include, ArrayExtension

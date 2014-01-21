class Grains
  def square(number)
    square_acc(number, 1)
  end

  def total
    sum_acc(64, 1, 1)
  end

  private

  def square_acc(number, accumulator)
    number == 1 ? accumulator : square_acc(number-1, 2 * accumulator)
  end

  def sum_acc(number, accumulator_square, accumulator_sum)
    if number == 1
      accumulator_sum
    else
      sum_acc(
        number-1, 
        2 * accumulator_square, 
        accumulator_sum + 2 * accumulator_square)
    end
  end
end

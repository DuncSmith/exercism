module SumOfMultiples

type SumOfMultiples(divisors) =
  new() = SumOfMultiples [3;5]

  member this.To(x) =
    let rec toAcc x acc =
      if x <= 1 then acc
      else if this.IsMultipleOfAny(x-1, divisors) then toAcc (x-1) (acc + x-1)
      else toAcc (x-1) acc
    toAcc x 0
  
  member this.IsMultipleOfAny(x, divisors) =
    match divisors with
    | [] -> false
    | [divisor] -> (x % divisor) = 0
    | divisor :: others -> this.IsMultipleOfAny(x, [divisor]) ||
                           this.IsMultipleOfAny(x, others)

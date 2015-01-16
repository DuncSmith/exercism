module SumOfMultiples

type SumOfMultiples(divisors) =
  new() = SumOfMultiples [3;5]

  member this.To(x) =
    if x <= 1 then 0
    else if this.IsMultipleOfAny(x-1, divisors) then x-1 + this.To(x-1)
    else this.To(x-1)
  
  member this.IsMultipleOfAny(x, divisors) =
    match divisors with
    | [] -> false
    | [divisor] -> (x % divisor) = 0
    | divisor :: others -> this.IsMultipleOfAny(x, [divisor]) ||
                           this.IsMultipleOfAny(x, others)

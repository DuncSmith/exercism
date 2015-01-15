module SumOfMultiples

type SumOfMultiples(divisors) =
  new() = SumOfMultiples [3;5]

  member this.To(x) =
    if x <= 1 then 0
    else (if this.IsMultipleOfAny(x-1, divisors) then x-1 else 0) + this.To(x-1)
  
  member this.IsMultipleOfAny(x, divisors) =
    not divisors.IsEmpty &&
    (this.IsMultiple(x, divisors.Head) ||
     this.IsMultipleOfAny(x, divisors.Tail))

  member this.IsMultiple(x, divisor) = (x % divisor) = 0

module SumOfMultiples

type SumOfMultiples(divisors) =
  new() = SumOfMultiples [3;5]

  member this.To limit =
    let values = [1 .. (limit-1)]
    List.sum (List.choose this.IsMultipleOfAny values)
  
  member private this.IsMultipleOfAny value =
    let isMultiple divisor = ((value % divisor) = 0)
    if (List.exists isMultiple divisors) then Some(value) else None

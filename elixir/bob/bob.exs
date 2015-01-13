defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      shout?(input) -> "Woah, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end
  
  defp silence?(input) do
    String.strip(input) == ""
  end
  
  defp shout?(input) do
    uppercase?(input) and alpha_chars?(input)
  end
  
  defp uppercase?(input) do
    input == String.upcase(input)
  end
  
  defp alpha_chars?(input) do
    String.match? input, ~r/[[:alpha:]]/
  end
  
  defp question?(input) do
    String.ends_with? input, "?"
  end
end

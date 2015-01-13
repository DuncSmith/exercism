defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      shouted?(input) -> "Woah, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end
  
  def question?(input) do
    String.ends_with? input, "?"
  end
  
  def shouted?(input) do
    uppercase?(input) and alpha_chars?(input)
  end
  
  def uppercase?(input) do
    input == String.upcase(input)
  end
  
  def alpha_chars?(input) do
    String.match? input, ~r/[[:alpha:]]/
  end
  
  def silence?(input) do
    String.strip(input) == ""
  end
end

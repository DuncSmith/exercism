class Bob
  def hey(something)
    return 'Woah, chill out!' if shouting?(something)
    return 'Sure.' if question?(something)
    'Whatever.'
  end
  
  def shouting?(something)
    saying_something_other_than_numbers?(something) and something == something.upcase
  end
  
  def question?(something)
    something.end_with? '?'
  end
  
  def saying_something_other_than_numbers?(something)
    something =~ /[A-Za-z]/
  end
end

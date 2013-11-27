class Bob
  def hey(something)
    return 'Woah, chill out!' if shouting?(something)
    return 'Sure.' if question?(something)
    'Whatever.'
  end
  
  def shouting?(something)
    something == something.upcase
  end
  
  def question?(something)
    something.end_with? '?'
  end
end

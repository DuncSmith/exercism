class Bob
  hey: (said) ->
    return 'Fine. Be that way!' if silence(said)
    return 'Whoa, chill out!' if shouting(said)
    return 'Sure.' if question(said)
    'Whatever.'

  silence = (said) -> said.trim() is ''

  shouting = (said) -> upperCase(said) and containsLetters(said)

  question = (said) -> endsWith('?', said)

  upperCase = (said) -> said is said.toUpperCase()

  containsLetters = (said) -> said.match(/[A-Z]/i)

  endsWith = (endChar, value) -> value.slice(-1) is endChar

module.exports = Bob

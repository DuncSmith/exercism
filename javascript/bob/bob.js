var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (isShout(input)) {
    return 'Woah, chill out!';
  }
  if (isQuestion(input)) {
    return 'Sure.';
  }
  if (isSilence(input)) {
    return 'Fine. Be that way!';
  }
  return 'Whatever.';
};
  
var isShout = function(input) {
  return isUpperCase(input) && containsLetters(input);
}
  
var isUpperCase = function(input) {
  return input === input.toUpperCase();
}
  
var containsLetters = function(input) {
  return input.match(/[A-Z]/i);
}
  
var isQuestion = function(input) {
  return endsWith(input, '?');
}

var endsWith = function(input, ending) {
  var lastIndex = input.lastIndexOf(ending);
  return lastIndex !== -1 && lastIndex === (input.length - ending.length);
}
  
var isSilence = function(input) {
  return input.trim() === "";
}

module.exports = Bob;

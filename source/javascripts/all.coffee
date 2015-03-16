#=  require_tree ./libs

require.config
  baseUrl: 'javascripts'


require ['first_words', 'second_words', 'third_words'], ->
  firsts = require 'first_words'
  seconds = require 'second_words'
  thirds = require 'third_words'

  bullshit = document.querySelector('#bullshit')
  bullshit_link = document.querySelector('#talkshit')

  bullshit_link.addEventListener "click", (e) ->
    e.preventDefault()

    first_word = firsts[Math.floor(Math.random()*firsts.length)];
    second_word = seconds[Math.floor(Math.random()*seconds.length)];
    third_word = thirds[Math.floor(Math.random()*thirds.length)];

    bullshit.innerHTML = "#{first_word} #{second_word} #{third_word}"


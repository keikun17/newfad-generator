#=  require_tree ./libs

require.config
  baseUrl: 'javascripts'


require ['first_words', 'second_words', 'third_words'], ->
  firsts = require 'first_words'
  seconds = require 'second_words'
  thirds = require 'third_words'

  bullshit = document.querySelector('#bullshit')
  bullshit_link = document.querySelector('#talkshit')

  # Social
  tweetlink = document.querySelector('#twitterlink')

  bullshit_link.addEventListener "click", (e) ->
    e.preventDefault()
    generate_bullshit()

  set_bullshit_text = (w1,w2,w3) ->
    bullshit.innerHTML = "#{w1} #{w2} #{w3}"

  rebuild_permalink = (w1,w2,w3) ->
    i1 = firsts.indexOf(w1)
    i2 = seconds.indexOf(w2)
    i3 = thirds.indexOf(w3)

    console.log("?s=#{i1}_#{i2}_#{i3}")
    window.history.pushState('', '' , "?s=#{i1}_#{i2}_#{i3}")

  generate_bullshit = ->

    w1 = firsts[Math.floor(Math.random()*firsts.length)];
    w2 = seconds[Math.floor(Math.random()*seconds.length)];
    w3 = thirds[Math.floor(Math.random()*thirds.length)];

    set_bullshit_text(w1,w2,w3)

    rebuild_permalink(w1,w2,w3)
    spread_that_thang()

  spread_that_thang = ->
    tweetlink.href = "https://twitter.com/intent/tweet?text=For our next meetup, I'll do a talk about #{bullshit.innerHTML} and why you should do it too"

  saved = window.location.search.replace('?s=','').split('_')

  if saved.length == 3
    first_word = firsts[saved[0]]
    second_word = seconds[saved[1]]
    third_word = thirds[saved[2]]
    set_bullshit_text(first_word, second_word, third_word)
  else
    generate_bullshit()




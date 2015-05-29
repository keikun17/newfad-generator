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

    window.history.pushState('', '' , "?s=#{i1}_#{i2}_#{i3}")

  generate_bullshit = ->

    w1 = firsts[Math.floor(Math.random()*firsts.length)];
    w2 = seconds[Math.floor(Math.random()*seconds.length)];
    w3 = thirds[Math.floor(Math.random()*thirds.length)];

    set_bullshit_text(w1,w2,w3)

    rebuild_permalink(w1,w2,w3)
    spread_that_thang()

  spread_that_thang = ->
    string = "For our next meetup I'll talk abt #{bullshit.innerHTML} & why you should do it too #{window.location.href}"
    tweetlink.href = "https://twitter.com/intent/tweet?text=" + encodeURIComponent(string)

  saved = window.location.search.replace('?s=','').split('_')

  if saved.length == 3
    w1 = firsts[saved[0]]
    w2 = seconds[saved[1]]
    w3 = thirds[saved[2]]

    set_bullshit_text(w1, w2, w3)
    spread_that_thang()
  else
    generate_bullshit()




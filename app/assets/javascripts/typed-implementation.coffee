ready = ->
  Typed.new '.element',
    strings: [
      'I’m a multi-disciplined designer and developer.'
      "I specialise in web-design and front-end development. I love to create clean, unique and elegant websites."
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
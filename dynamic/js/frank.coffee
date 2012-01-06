(->
  collapse = undefined
  easeInOutQuad = undefined
  expand = undefined
  expanded = undefined
  expanding = undefined
  init = undefined
  slide = undefined
  toggle = undefined
  easeInOutQuad = easeInOutQuad = (t, b, c, d) ->
    ((t /= d / 2) < 1) and (c / 2 * t * t + b) or (-c / 2 * ((--t) * (t - 2) - 1) + b)

  expanded = false
  expanding = false
  slide = slide = (el, end, duration, start, now) ->
    now = now or 0.001
    start = start or parseInt(document.defaultView.getComputedStyle(el, null).getPropertyValue("left"))
    el.style.left = Math.round(start + (end - start) * easeInOutQuad(now, 0, 1, duration)) + "px"
    now += 30
    (if now < duration then setTimeout(->
      slide el, end, duration, start, now
    , 30) else expanding = false)

  expand = expand = ->
    document.getElementById("tooltip").style.display = "none"
    slide document.getElementById("header"), 75, 600
    slide document.getElementById("help"), 525, 600

  collapse = collapse = ->
    document.getElementById("tooltip").style.display = "block"
    slide document.getElementById("header"), 300, 600
    slide document.getElementById("help"), 300, 600

  toggle = toggle = (e) ->
    return false  if expanding
    expanded = not expanded
    expanding = true
    (if expanded then expand() else collapse())
    false

  init = init = ->
    document.addEventListener "click", toggle, false

  window.onload = init
)()

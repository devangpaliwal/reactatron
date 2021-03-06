require 'shouldhave/Object.assign'
require 'shouldhave/Array#unique'
isObject = require 'shouldhave/isObject'



console.warn """


You need to take a step back from Reactatron

This is a brilliant spike

Build something that
- works on mobile, tablet and desktop
- has a defined set of layout components
- style and animation are easy and work everywhere


build some tiny example apps. maybe in the docs app?


"""


module.exports = class Style

  ###*
  # Document me!
  #
  ###
  constructor: (style) ->
    return style if style instanceof Style
    return new Style(style) unless this instanceof Style
    @extend(style)

  ###*
  # Document me!
  #
  ###
  clone: ->
    Style().extend(this)

  ###*
  # Document me!
  #
  ###
  replace: (style) ->
    keys = Object.keys(this).concat(Object.keys(style)).unique()
    for key in keys
      if key of style
        this[key] = style[key]
      else
        delete this[key]
    this

  ###*
  # Document me!
  #
  ###
  extend: (style) ->
    assign(this, style)

  ###
    @alias update
  ###
  update: (style) ->
    console.trace 'Style#update deprecated use Style#extend'
    @extend(style)

  ###*
  # Document me!
  #
  ###
  reverseExtend: (style) ->
    @replace @reverseMerge(style)

  ###*
  # Document me!
  #
  ###
  merge: (style) ->
    @clone().extend(style)

  ###*
  # Document me!
  #
  ###
  reverseMerge: (style) ->
    Style(style).merge(this)

  ###*
  # Document me!
  #
  ###
  compute: (state) ->
    style = compressStates(this, state)
    corssBrowserSupprt(style)
    style

META_SELECTOR_KEY = /^:(.+)/
compressStates = (style, state) ->
  compressedStyle = {}
  for key in Object.keys(style)
    if key.match(META_SELECTOR_KEY)
      Object.assign(compressedStyle, style[key]) if state[RegExp.$1]
    else
      compressedStyle[key] = style[key]
  compressedStyle


#
# TODO - this is called a fuck ton. This should be benchmarked
#
#
assign = (left, right, deep=true) ->
  # console.count('Style#assign')
  # global.DEBUG?.app?.stats?.styleAssigns++
  return left if !right?
  rightKeys = Object.keys(right)
  for key in rightKeys
    rightValue = right[key]
    if deep && isObject(rightValue)
      leftValue = left[key] ||= {}
      assign(leftValue, rightValue, false)
    else
      left[key] = rightValue
  left


corssBrowserSupprt = (style) ->
  # if style.display == 'flex'




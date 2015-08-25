component = require './component'
Box = require './Box'

module.exports = component 'Rows',

  defaultStyle:
    # height: '100%'
    display: 'inline-flex'
    alignItems: 'stretch'
    alignContent: 'stretch'
    flexDirection: 'row'
    flexWrap: 'nowrap'
    justifyContent: 'flex-start'

  render: ->
    Box(@cloneProps())

# Reactatron

## Known Unknowns

- Do we need to shove children into props for every component?

## TODO

- listen to the 'storage' event to respond to localStorage changes in other tabs
- support localStorage and sessionStorage

## thoughs

- React but with the functions (AKA factory) way
- built for coffee script (maybe ES6?)
- has a flux-like event based system
- has a key,value store persisted in localStorage as json
- has a dead simple data binding system
- provide a super api for making components
- provide subclassing components
- eveything is built as modules with the borders well documented
- module: js css framework (need benchmarking)
- we provide the start and stop level boilerplate code
- maybe we prevent components from being defined dynanically because we know start/stop state

#### Data

- we need a way to get "data" that is stored in difference places
- localStorage, sessionStorage and memoryStorage (3?)

data caching should be in local storage
UI state should be in sessionStorage
and thinkgs like the current route should just be in memory

it would be nice to be able to configure keys

app.configKey 'route', storage: 'memory'
app.configKey 'openDirectories', storage: 'session'
app.configKey 'files', storage: 'local'

## Arcitecture


#### component

- A Reactatron Components is any function that returns a React Element
- Reactatron/DOM is every React.DOM element in function (React.createFactory) form


###### Questions:

- If you pass children in as arguments to a React Component `props.children` is ignored
- How do we make `ReactElement.createElement(child.type, newProps)` work with functions?


#### Styled Component

A Styled Component is a wrapper that merges the given style prop the style object given
at component definition time

```coffee
{div} = require 'reactatron/DOM'

module.exports = div.withStyle 'RedBox',
  borderColor: 'red'
```



#### App

- starts and stops the global listeners like popstate
- initializes the state of the app
- do we need some sort of "plugin" system here? NO!!!


#### State


- state is a value store where the value must be a string so we use JSON



- this is given to the page component
  - which should pull the data it needs and also register a handler
- all of its top level values are available
- um... stores state?
- lets you know when state changes
- lets you ask for the values of keys and get the current valye and updates, via callback and imediate return

```coffee

keys = [
  'current_user.first_name',
  'current_user.last_name',
]

state.get keys, (values) ->
  {first_name, last_name} = values
  # or better yet
  @setState(values)


component 'FilesPage',

  getInitialState: ->
    data = App.tellMeWhenChange(

    )
    @setState(data)

  render: ->
    {first_name, last_name} = App.state.current_user
    h1(null, "Welcome back #{first_name} #{last_name}")






#### React Tree



#### Actions



```js
ReactatronApp = require('reactatron/App')
App = new ReactatronApp

App.router.map ->
  @match '/', @redirectTo '/transfers'

App.start()
App.stop()

@context.path
@context.params
@context.setPath(path)
@context.setParams(params)
@context.setLocation(path, params)

App.on 'location:change',  @onLocationChange
App.off 'location:change', @onLocationChange
App.routes ->
  @match

Button = require('components/Button')
App.component 'MagicButton',
  render: ->
    Button()
```

There needs to be an internal way, other than the app the user create, to set the location
or not create apps?








#### Components

- Text

No text is selectable unless wrapped in one of these text components

- ColumnsContainer
- RowsContainer
- Button
- Link




### Documentation


?? https://github.com/coffeedoc/codo ??







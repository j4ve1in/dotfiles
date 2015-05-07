## atom-utils

[![Build Status](https://travis-ci.org/abe33/atom-utils.svg?branch=master)](https://travis-ci.org/abe33/atom-utils)

A bunch of general purpose utilities for Atom packages.

### requirePackages

Returns a promise that is only resolved when all the requested packages have been activated.

```coffee
{requirePackages} = require 'atom-utils'

requirePackages('tree-view', 'find-and-replace', 'snippets')
.then ([treeView, findAndReplace, snippets]) ->
  # Do something with the required packages
```

### AncestorsMethods

A mixin that provides jQuery a like method to retrieve a node's parents:

```coffee
{AncestorsMethods} = require 'atom-utils'

class DummyNode extends HTMLElement
  AncestorsMethods.includeInto(this)

  attachedCallback: ->
    # Returns all the ancestors to the html element
    parents = @parents()

    # Returns all the ancestors that matches the selector
    filteredParents = @parents('selector')

# It creates the custom element and register with as the `dummy-node` tag.
DummyNode = document.registerElement 'dummy-node', prototype: DummyNode.prototype
```

### DisposableEvents

A mixin that provides a `addDisposableEventListener` method that registers an event listener on an element and returns a `Disposable` to unregister it:

```coffee
{DisposableEvents} = require 'atom-utils'
{CompositeDisposable} = require 'event-kit'

class DummyNode extends HTMLElement
  DisposableEvents.includeInto(this)

  createdCallback: ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add @addDisposableEventListener this, 'click', (e) =>
      # ...

# It creates the custom element and register with as the `dummy-node` tag.
DummyNode = document.registerElement 'dummy-node', prototype: DummyNode.prototype
```

### EventsDelegation

A mixin that provides events delegation ala jQuery without jQuery.
Use it by including it into your custom element:

```coffee
{EventsDelegation} = require 'atom-utils'
{CompositeDisposable} = require 'event-kit'

class DummyNode extends HTMLElement
  # It includes the mixin on the class prototype.
  EventsDelegation.includeInto(this)

  # Custom element's callback on creation.
  createdCallback: ->
    @subscriptions = new CompositeDisposable

    @appendChild(document.createElement('div'))
    @firstChild.appendChild(document.createElement('span'))

    # Without a target and a selector, it registers to the event on the
    # element itself.
    # The `subscribeTo` method returns a disposable that unsubscribe from
    # all the events that was added by this call.
    @subscriptions.add @subscribeTo
      click: (e) ->
        console.log("won't be called if the click is done on the child div")

    # With just a selector, it registers to the event on the elements children
    # matching the passed-in selector.
    @subscriptions.add @subscribeTo 'div',
      click: (e) ->
        console.log("won't be called if the click is done on the child span")
        # Events propagation can be used to prevents the delegated handlers
        # to catch the events in continuation.
        e.stopPropagation()

    # By passing a node and a selector, it registers to the event on the
    # elements children matching the passed-in selector.
    @subscriptions.add @subscribeTo @firstChild, 'span',
      click: (e) ->
        e.stopPropagation()

# It creates the custom element and register with as the `dummy-node` tag.
DummyNode = document.registerElement 'dummy-node', prototype: DummyNode.prototype
```

### ResizeDetection

As there is no standard way to detect when an element size changed this mixin provides a DOM polling mechanism to custom element whose display and logic may rely on the element size:

```coffee
{ResizeDetection} = require 'atom-utils'

class DummyNode extends HTMLElement
  ResizeDetection.includeInto(this)

  # Starts the DOM poll when the element is attached
  attachedCallback: -> @initializeDOMPolling()

  # Stops the DOM poll when the element is detached
  detachedCallback: -> @disposeDOMPolling()

  # Callback called when the poll routine has detected a size change.
  # The callback receive the new width and height as arguments.
  resizeDetected: (width, height) ->

  # If you need to prevent the poll routine to check the element size,
  # redefine this method with your own conditions. The function should return
  # false when the polling can occurs.
  # isDOMPollingPrevented: -> @domPollingPaused
```

If you need to suspend the polling while keeping the interval active you can use the `pauseDOMPolling` to pause the polling routine and `resumeDOMPolling` to resume it.

### SpacePenDSL

A mixin that provides the same content creation mechanism as `space-pen` but for custom elements:

```coffee
{SpacePenDSL} = require 'atom-utils'

class DummyNode extends HTMLElement
  SpacePenDSL.includeInto(this)

  @content: ->
    @div outlet: 'container', class: 'container', =>
      @span outlet: 'label', class: 'label'

  createdCallback: ->
    # Content is available in the created callback

# It creates the custom element and register with as the `dummy-node` tag.
DummyNode = document.registerElement 'dummy-node', prototype: DummyNode.prototype
```

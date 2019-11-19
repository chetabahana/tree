'use strict'

const createQuery = require('./')
const GraphiQL = require('graphiql')
const ReactDOM = require('react-dom')
const React = require('react')
const ready = require('domready')
const vm = require('vm')
const kDefaultQuery = ``

let query
let currentQuerySource = null


ready(() => {
  const canvas = document.querySelector('#viewport canvas')
  query = createQuery({canvas})
  requestAnimationFrame(tick)
  function tick() {
    requestAnimationFrame(tick)

    const wrap = document.querySelector('#graphiql .resultWrap')
    const style = wrap ? getComputedStyle(wrap) : {
      width: window.innerWidth * .49,
      height: window.innerHeight - 48
    }

    const width = parseFloat(style.width)
    const height = parseFloat(style.height)

    query.context.set('width', width)
    query.context.set('height', height)

    query(currentQuerySource || kDefaultQuery)
    .catch((err) => console.error(err))
  }
})

ready(() => {
  const domElement = document.getElementById('graphiql')
  const reactElement = React.createElement(GraphiQL, {
    query: currentQuerySource || kDefaultQuery,
    fetcher: fetcher,
    variables: '',
    response: '',
    onEditQuery: onEditQuery,
    onEditVariables: onEditVariables,
  })

  ReactDOM.render(reactElement, domElement)

  function fetcher(params) {
    let vars = {}
    if (params.variables) {
      try { vars = JSON.parse(params.variables) }
      catch (e) { }
      for (let key in vars) {
        query.context.set(key, vars[key])
      }
    }
    return query(params.query)
  }

  function onEditQuery (q) {
    currentQuerySource = q
  }

  function onEditVariables(value) {
    let parsed
    try { parsed = JSON.parse(value) }
    catch (e) { }
    if (parsed && 'object' == typeof parsed) {
      query.context.extend(parsed)
    }
  }
})

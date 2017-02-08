import React from 'react'
import ReactDOM from 'react-dom'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import App from './App'
import Home from './Home'
import About from './About'
import Services from './Services'
import './index.css'

ReactDOM.render(
  <Router history={browserHistory}>
    <Route path="/" component={App}>
      <IndexRoute component={Home} />
      <Route path="about" component={About} />
      <Route path="services" component={Services} />
      <Route path="posts" component={About} />
      <Route path="contacts" component={About} />
    </Route>
  </Router>,
  document.getElementById('root')
)

import React, { Component } from 'react'
import { Link } from 'react-router'
import css from './App.css'

class App extends Component {
  render() {
    return (
      <div {...css}>
        <header>
          <nav className="container-fluid">
            <div className="row">
              <div className="col-xs-2 col-sm-8">
                <ul>
                  <li><Link to="/">Home</Link></li>
                  <li><Link to="/about"><i>About</i> Jane</Link></li>
                  <li><Link to="/gallery">Gallery</Link></li>
                  <li><Link to="/services">Services</Link></li>
                  <li><Link to="/posts">Blog</Link></li>
                  <li><Link to="/contacts/new">Contact</Link></li>
                </ul>
              </div>
              <div className="col-xs-10 col-sm-4 end-xs">
                Social
              </div>
            </div>
          </nav>
          <h1 className="center-xs"><Link to="/">the GLAMOURIST</Link></h1>
        </header>
        <main>{this.props.children}</main>
      </div>
    )
  }
}

export default App

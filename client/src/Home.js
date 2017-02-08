import React, { Component } from 'react'
import { Link } from 'react-router'

class Home extends Component {
  render() {
    return (
      <div className="container-fluid">
        <div className="row">
          <div className="col-sm-6">
            <img src="https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/1239253_797921786902719_1817115056_o.jpg?oh=2b3bbdb4c99c0c958ab24bdc0ecd10f0&oe=5917A757" />
          </div>
          <div className="col-sm-6 col-md-3">
            <h2><Link to="about">About</Link></h2>
            <p>
              Jane Kim, owner and founder of The Glamourist, is an award
              winning <b>makeup artist</b> and <b>hair stylist</b> based in San
              Francisco.
            </p>
          </div>
          <div className="col-sm-6 col-md-3">
            <h2><Link to="contacts/new">Contact</Link></h2>
            <p>
              <a href="mailto:jane@theglamourist.com">jane@theglamourist.com</a>
              <br/>
              <a href="tel:+14158605872">(415) 860-5872</a>
            </p>
          </div>
          <div className="col-sm-6">
            <h2><Link to="services">Services</Link></h2>
            <p>
              <Link to="services">Bridal, Engagement, Trial Sessions</Link>;
              <Link to="services">Commercial, Fashion</Link>;
              <Link to="services">Boudoir</Link>;
              <Link to="services">Makeup Lessons</Link>
            </p>
            <p>
              Available for travel around the SF Bay Area, to Los Angeles, and
              worldwide.
            </p>
          </div>
          <div className="col-sm-6 col-md-3">
            <h2>Gallery</h2>
          </div>
          <div className="col-sm-6 col-md-3">
            <h2>Blog</h2>
          </div>
        </div>
      </div>
    )
  }
}

export default Home

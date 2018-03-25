import React, { Component } from 'react'
import styled from 'styled-components'
import Section from '../components/section'

class Photos extends Component {
  state = { paddingLeft: 0 }

  componentDidMount() {
    let width = this.container.getBoundingClientRect().width -
                this.img.getBoundingClientRect().width
    if (width > 0)
      this.setState({ paddingLeft: width / 2 })
    else
      this.container.scrollLeft = -width / 2
  }

  render() {
    return (
      <Section {...this.props}>
        <div className="container" style={{ paddingLeft: this.state.paddingLeft }} ref={container => this.container = container}>
          <img ref={img => this.img = img} src="/static/photos/001_elizabethmessinaFAVORITES.jpg" />
          <img src="/static/photos/012_elizabethmessinaFAVORITES.jpg" />
          <img src="/static/photos/014_elizabethmessinaFAVORITES.jpg" />
          <img src="/static/photos/116_elizabethmessinaFAVORITES.jpg" />
          <img src="/static/photos/119_elizabethmessinaFAVORITES.jpg" />
          <img src="/static/photos/000076780033.jpg" />
          <img src="/static/photos/000077100016.jpg" />
          <img src="/static/photos/000077220011.jpg" />
          <img src="/static/photos/000077450007.jpg" />
          <img src="/static/photos/000077610013.jpg" />
          <img src="/static/photos/000077650003.jpg" />
          <img src="/static/photos/000077780012.jpg" />
        </div>
      </Section>
    )
  }
}

export default styled(Photos)`
  // padding: 0;
  // margin: 0;

  .container {
    height: 70vh;
    padding: 0;
    margin: 0;
    white-space: nowrap;
    overflow-x: auto;
    overflow-y: hidden;
    -webkit-overflow-scrolling: touch;
    scroll-snap-type: x mandatory;
    scroll-snap-destination: 50% 50%;
  }

  img {
    height: 100%;
    margin: 0 10px;
    scroll-snap-align: center;
  }
`

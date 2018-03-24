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
          <img ref={img => this.img = img} src="/static/photos/27878230_413955342373291_4665685564203204608_n.jpg" />}
          <img src="/static/photos/27893084_171014887020535_2728928469332262912_n.jpg" />
          <img src="/static/photos/28151997_417089678744153_7321564065828962304_n.jpg" />
          <img src="/static/photos/25007066_923003567876044_1388286846299013120_n.jpg" />
          <img src="/static/photos/23668123_1603435529719419_490774200538103808_n.jpg" />
          <img src="/static/photos/27877883_756039844586619_299669991479836672_n.jpg" />
        </div>
      </Section>
    )
  }
}

export default styled(Photos)`
  .container {
    height: 75vh;
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
    margin: 0;
    scroll-snap-align: center;
  }
`

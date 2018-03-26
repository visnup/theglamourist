import React, { Component } from 'react'
import styled from 'styled-components'
import Section from '../components/section'
import Carousel from '../components/carousel'

const photos = [
  "001_elizabethmessina.jpg",
  "012_elizabethmessina.jpg",
  "014_elizabethmessina.jpg",
  "116_elizabethmessina.jpg",
  "119_elizabethmessina.jpg",
  "000076780033.jpg",
  "000077100016.jpg",
  "000077220011.jpg",
  "000077450007.jpg",
  "000077610013.jpg",
  "000077650003.jpg",
  "000077780012.jpg",
]

const arrow = `
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="-3 -3 16 16">
<path d="M5,0L10,5L5,10" fill="none" stroke="hsla(0, 0%, 0%, .6)" stroke-width="2px" stroke-linecap="round" />
</svg>
`
const Arrow = styled.div`
  position: absolute;
  top: 0;
  bottom: 0;
  left: ${({direction}) => direction === 'left' ? '0px' : 'auto'};
  right: ${({direction}) => direction === 'right' ? '0px' : 'auto'};
  width: 100px;
  background: url('data:image/svg+xml,${arrow}') no-repeat center center;
  transform: scaleX(${({direction}) => direction === 'left' ? -1 : 1});
  cursor: pointer;
`
  // background: linear-gradient(90deg, hsla(0, 0%, 100%, ${({direction}) => direction === 'left' ? 0.8 : 0}), hsla(0, 0%, 100%, ${({direction}) => direction === 'left' ? 0 : 0.8}));

class Photos extends Component {
  state = { index: 0 }

  incrementIndex(increment) {
    this.setState({
      index: (this.state.index + increment + photos.length) % photos.length
    })
  }

  render() {
    return (
      <Section {...this.props}>
        <Arrow direction="left" onClick={() => this.incrementIndex(-1)} />
        <Carousel
          photos={photos}
          index={this.state.index}
          onScroll={index => this.setState({ index })}
        />
        <Arrow direction="right" onClick={() => this.incrementIndex(+1)} />
      </Section>
    )
  }
}

export default styled(Photos)`
  padding: 0;
  margin: 6em 0;
  max-width: 100%;
  position: relative;
`

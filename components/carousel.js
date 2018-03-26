import React, { Component } from 'react'
import { sortedIndexBy, debounce } from 'lodash'
import scroll from 'scroll'
import PropTypes from 'prop-types'
import styled from 'styled-components'

class Carousel extends Component {
  static propTypes = {
    photos: PropTypes.arrayOf(PropTypes.string),
    index: PropTypes.number,
    onScroll: PropTypes.func,
  }

  static defaultProps = {
    photos: [],
    index: 0,
    onScroll: () => {},
  }

  ref = null
  imgRefs = []
  state = { style: {}, height: 100 }

  addImgRef = ref => {
    if (this.imgRefs.indexOf(ref) === -1)
      this.imgRefs.push(ref)
  }

  componentDidMount() {
    // pad based on first and last images
    const { width, height } = this.ref.getBoundingClientRect(),
          paddingLeft = Math.max(width - this.imgRefs[0].getBoundingClientRect().width, 0) / 2,
          paddingRight = Math.max(width - this.imgRefs[this.imgRefs.length-1].getBoundingClientRect().width, 0) / 2
    this.setState({ style: { paddingLeft, paddingRight }, height: Math.floor(height) })

    this.scrollTo(this.props.index)
  }

  componentDidUpdate(prevProps) {
    if (prevProps.index !== this.props.index)
      this.scrollTo(this.props.index)
  }

  scrollTo(index) {
    if (index < 0 || index >= this.imgRefs.length)
      return

    const img = this.imgRefs[index],
          rect = img.getBoundingClientRect(),
          width = this.ref.getBoundingClientRect().width - rect.width
    scroll.left(this.ref, this.ref.scrollLeft + rect.left - (width / 2))
  }

  onScroll = debounce(() => {
    const { width } = this.ref.getBoundingClientRect(),
          middle = { getBoundingClientRect() { return { left: width / 2 } } },
          index = sortedIndexBy(this.imgRefs, middle, i => i.getBoundingClientRect().left)
    this.props.onScroll(index - 1)
  }, 100)

  render() {
    const { photos } = this.props
    const { style, height } = this.state
    return (
      <div
        {...this.props}
        style={style}
        ref={ref => this.ref = ref}
        onScroll={this.onScroll}
      >
        {photos.map(photo => (
          <img
            srcSet={`https://theglamourist.imgix.net/photos/${photo}?h=${height} 1x,
                     https://theglamourist.imgix.net/photos/${photo}?h=${height}&dpr=2 2x,
                     https://theglamourist.imgix.net/photos/${photo}?h=${height}&dpr=3 3x`}
            src={`https://theglamourist.imgix.net/photos/${photo}?h=${height}`}
            alt=""
            ref={this.addImgRef}
            key={photo}
          />
        ))}
      </div>
    )
  }
}

export default styled(Carousel)`
  height: 75vh;
  padding: 0;
  margin: 0;
  white-space: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
  -webkit-overflow-scrolling: touch;
  scroll-snap-type: x mandatory;
  scroll-snap-destination: 50% 50%;

  > img {
    height: 100%;
    margin: 0 10px;
    scroll-snap-align: center;
  }
`

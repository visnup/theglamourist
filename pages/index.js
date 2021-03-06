import React, { Component } from 'react'
import Head from 'next/head'
import styled from 'styled-components'
import { throttle } from 'lodash'
import Container from '../components/container'
import About from '../sections/about'
import Contact from '../sections/contact'
import Photos from '../sections/photos'
import Services from '../sections/services'

class Index extends Component {
  state = {
    scrolled: false
  }

  componentDidMount() {
    window.addEventListener('scroll', this.handleScroll)
  }

  componentWillUnmount() {
    window.removeEventListener('scroll', this.handleScroll)
  }

  handleScroll = throttle((e) => {
    if (window.scrollY > 100) {
      if (!this.state.scrolled) {
        this.setState({ scrolled: true })
      }
    } else {
      if (this.state.scrolled) {
        this.setState({ scrolled: false })
      }
    }
  }, 100)

  render() {
    return (
      <Container {...this.props}>
        <Head>
          <title>The Glamourist - Jane Kim - Makeup Artist (San Francisco)</title>
          <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no" />
          <meta name="description" content="Jane Kim, owner and founder of The Glamourist, is an award winning makeup artist and hair stylist based in San Francisco." />
          <script async src="https://www.googletagmanager.com/gtag/js?id=UA-30354035-1"></script>
          <script dangerouslySetInnerHTML={{__html: `
            window.dataLayer = window.dataLayer || []
            function gtag(){ dataLayer.push(arguments) }
            gtag('js', new Date())
            gtag('config', 'UA-30354035-1')
          `}} />
        </Head>
        <header className={this.state.scrolled ? 'scrolled' : undefined}>
          <h1>the Glamourist</h1>
        </header>
        <Photos id="gallery" />
        <About id="about" />
        <Contact id="contact" />
        <Services id="services" />
      </Container>
    )
  }
}

export default styled(Index)`
  > header {
    text-align: center;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    padding: 20px 0;
    transition: all .1s ease-in;
  }

  > header > h1 {
    color: transparent;
    background: url('/static/logo.svg') no-repeat center center;
    background-size: contain;
    margin: 0;
    height: 1em;
    transition: height .1s ease-in;

    @media (min-width: 48rem) {
      height: 1.2em;
    }
  }

  > header.scrolled {
    background-color: hsla(0, 0%, 100%, .8);
    box-shadow: 0 0 3px hsla(0, 0%, 80%, .8);
  }

  > header.scrolled > h1 {
    height: .75em;
  }
`

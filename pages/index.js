import styled from 'styled-components'
import Container from '../components/container'
import About from '../sections/about'
import Contact from '../sections/contact'
import Photos from '../sections/photos'
import Services from '../sections/services'

const Index = (props) => (
  <Container {...props}>
    <header>
      <h1>the Glamourist</h1>
      <nav>
        <a href="#gallery">Gallery</a>
        {' '}
        <a href="#about">About</a>
        {' '}
        <a href="#contact">Contact</a>
        {' '}
        <a href="#services">Services</a>
      </nav>
    </header>
    <Photos id="gallery" />
    <About id="about" />
    <Contact id="contact" />
    <Services id="services" />
  </Container>
)

export default styled(Index)`
  > header {
    text-align: center;
  }

  > header > h1 {
    color: transparent;
    background: url('/static/logo@2x.png') no-repeat center center;
    background-size: contain;
  }
`

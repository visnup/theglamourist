import styled from 'styled-components'
import Container from '../components/container'
import About from '../sections/about'
import Contact from '../sections/contact'
import Services from '../sections/services'

const Index = (props) => (
  <Container {...props}>
    <header>
      <h1>the Glamourist</h1>
    </header>
    <About />
    <Contact />
    <Services />
  </Container>
)

export default styled(Index)`
  > header {
    background: url('/static/logo@2x.png') no-repeat center center;
    background-size: contain;
    text-align: center;
  }

  > header > h1 {
    color: transparent;
  }
`

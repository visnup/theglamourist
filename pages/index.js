import Container from '../components/container'
import About from '../sections/about'
import Contact from '../sections/contact'
import Services from '../sections/services'

const Index = () => (
  <Container>
    <header>
      <h1>The Glamourist</h1>
    </header>
    <About />
    <Contact />
    <Services />
  </Container>
)

export default Index

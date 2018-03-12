import Container from '../components/container'
import About from '../sections/about'
import Services from '../sections/services'
import Contact from '../sections/contact'

const Index = () => (
  <Container>
  <header>
    <h1>The Glamourist</h1>
  </header>
    <About />
    <Services />
    <Contact />
  </Container>
)

export default Index

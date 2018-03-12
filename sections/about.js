import styled from 'styled-components'
import Section from '../components/section'

const About = ({ className }) => (
  <Section className={className}>
    <h1>About</h1>

    <h2>I love empowering women through beauty.</h2>

    <p>
      A clumsy makeup artist, a new wife, daughter, sister and a mother to 2
      furry babies... I laugh a lot, find amusement in the random things, and
      Instagram lot.
    </p>

    <p>
      I'm a lover of simplicity, effortless style, clean design, and random
      occurrences. You can often find me in false lashes, sipping on an iced
      coffee or enjoying a refreshing glass of white wine. I enjoy a good
      weekend brunch, great conversation, and even better company.
    </p>

    <p>
      To know me is to love me so get to know me here.
    </p>

    <p>
      Oh yea, puppies are my weakness.
    </p>
  </Section>
)

export default styled(About)`
  background-image: url('/static/468544_395172810510954_812616719_o.jpg');
  background-size: cover;
  min-height: 800px;
`

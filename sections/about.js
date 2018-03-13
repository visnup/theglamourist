import Markdown from 'react-remarkable'
import styled from 'styled-components'
import Section from '../components/section'

const source = `
I love empowering women through beauty.
---------------------------------------

A clumsy makeup artist, a new wife, daughter, sister and a mother to 2
furry babies... I laugh a lot, find amusement in the random things, and
Instagram lot.

I'm a lover of simplicity, effortless style, clean design, and random
occurrences. You can often find me in false lashes, sipping on an iced
coffee or enjoying a refreshing glass of white wine. I enjoy a good
weekend brunch, great conversation, and even better company.

To know me is to love me so get to know me here.

Oh yea, puppies are my weakness.
`

const About = ({ className }) => (
  <Section className={className}>
    <h1>About</h1>
    <Markdown source={source} />
  </Section>
)

export default styled(About)`
  background-image: url('/static/468544_395172810510954_812616719_o.jpg');
  background-size: cover;
  background-position: bottom center;
  padding-bottom: 150% !important;

  @media (min-width: 48rem) {
    padding-bottom: 40% !important;
  }
`

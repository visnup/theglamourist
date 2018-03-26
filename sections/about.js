import Markdown from 'react-remarkable'
import styled from 'styled-components'
import { Row, Column } from '../components/grid'
import Section from '../components/section'

const source = `
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

const About = (props) => (
  <Section {...props}>
    <Row style={{alignItems: 'center'}}>
      <Column xs={12} sm={5}>
        <h2>About</h2>
        <Markdown source={source} options={{typographer: true}}/>
      </Column>
      <Column xs={12} sm={1}></Column>
      <Column xs={12} sm={6}>
        <img
          srcset="https://theglamourist.imgix.net/25038993_1611609495572717_8995398385418633216_n.jpg?h=640 1x,
                  https://theglamourist.imgix.net/25038993_1611609495572717_8995398385418633216_n.jpg?h=640&dpr=2 2x,
                  https://theglamourist.imgix.net/25038993_1611609495572717_8995398385418633216_n.jpg?h=640&dpr=3 3x"
          src="https://theglamourist.imgix.net/25038993_1611609495572717_8995398385418633216_n.jpg?h=640"
        />
      </Column>
    </Row>
  </Section>
)

export default styled(About)`
  img {
    width: 100%;
  }
`

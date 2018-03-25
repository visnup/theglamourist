import styled from 'styled-components'
import Section from '../components/section'
import { Row as _Row, Column as _Column } from '../components/grid'
import Form from '../components/contact-form'

const Contact = (props) => (
  <Section {...props}>
    <Row>
      <Column xs={12} sm={6}>
        <Form />
      </Column>
      <Column xs={12} sm={6} style={{textAlign: 'center'}}>
        <h2>Contact</h2>

        Jane Kim<br/>
        <a href="mailto:jane@theglamourist.com">jane@theglamourist.com</a><br/>
        <a href="tel:14158605872">(415) 860-5872</a>
      </Column>
    </Row>
  </Section>
)

const Row = styled(_Row)`
  align-items: center;
  flex-direction: column-reverse;

  @media (min-width: 48rem) {
    flex-direction: row;
  }
`

const Column = styled(_Column)`
  margin: 1em 0;
`

export default Contact

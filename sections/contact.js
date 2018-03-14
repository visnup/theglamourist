import Section from '../components/section'
import { Row, Column } from '../components/grid'
import Form from '../components/contact-form'

const Contact = (props) => (
  <Section {...props}>
    <h1>Contact</h1>
    <Row>
      <Column xs={12} sm={6}>
        <Form />
      </Column>
      <Column xs={12} sm={6}>
        Hello
      </Column>
    </Row>
  </Section>
)

export default Contact

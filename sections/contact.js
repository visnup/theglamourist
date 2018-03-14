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
        Jane Kim<br/>
        jane@theglamourist.com<br/>
        (415) 860-5872

        <h2>Locations</h2>
        <h3>Studio & Appointments</h3>
        Blu Bungalow<br/>
        2068 Union St.<br/>
        San Francisco, CA 94043

        <h3>Mail & Correspondence</h3>
        1301 Indiana St. Ste. 203<br/>
        San Francisco, CA 94107<br/>

        Available for travel worldwide.
      </Column>
    </Row>
  </Section>
)

export default Contact

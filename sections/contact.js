import Section from '../components/section'
import { Row, Column } from '../components/grid'
import Form from '../components/contact-form'

const map = [
  ['size', '327x184'],
  ['scale', 2],
  ['zoom', 14],
  ['center', '2068 Union St, SF, CA'],
  ['markers', 'size:small|2068 Union St'],
  ['style', 'feature:poi|element:labels|visibility:off'],
  ['key', 'AIzaSyBSwu3zSEGqvtv74eG7YLfGzfehbdjn_oM'],
].map(([k, v]) => `${k}=${encodeURIComponent(v)}`).join('&')

const Contact = (props) => (
  <Section {...props}>
    <h1>Contact</h1>
    <Row>
      <Column xs={12} sm={8}>
        <Form />
      </Column>
      <Column xs={12} sm={4}>
        Jane Kim<br/>
        <a href="mailto:jane@theglamourist.com">jane@theglamourist.com</a><br/>
        <a href="tel:14158605872">(415) 860-5872</a>

        <h2>Locations</h2>
        <h3>Studio & Appointments</h3>
        <a href="https://maps.google.com/maps?q=Blu+Bungalow&hl=en&ll=37.800188,-122.433314&spn=0.022109,0.033517&cid=15634673860134688280&gl=US&t=m&z=15&iwloc=A">
          Blu Bungalow<br/>
          2068 Union St.<br/>
          San Francisco, CA 94043
          <img style={{width: '327px', height:'184px'}} src={`https://maps.googleapis.com/maps/api/staticmap?${map}`} />
        </a>

        <h3>Mail & Correspondence</h3>
        <a href="https://maps.google.com/maps?q=The+Glamourist&hl=en&ll=37.753717,-122.390656&spn=0.022123,0.033517&cid=14521749320186323615&gl=US&t=m&z=15&iwloc=A">
          1301 Indiana St. Ste. 203<br/>
          San Francisco, CA 94107<br/>
        </a>

        Available for travel worldwide.
      </Column>
    </Row>
  </Section>
)

export default Contact

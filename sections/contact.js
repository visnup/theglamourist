import styled from 'styled-components'
import Section from '../components/section'
import { Row, Column } from '../components/grid'
import Form from '../components/contact-form'

const mapWidth = 307
const mapHeight = Math.floor(mapWidth / 16 * 9)

const map = [
  ['size', `${mapWidth}x${mapHeight}`],
  ['scale', 2],
  ['zoom', 14],
  ['center', '2068 Union St, SF, CA'],
  ['markers', 'size:small|2068 Union St'],
  ['style', 'feature:poi|element:labels|visibility:off'],
  ['key', 'AIzaSyBSwu3zSEGqvtv74eG7YLfGzfehbdjn_oM'],
].map(([k, v]) => `${k}=${encodeURIComponent(v)}`).join('&')

const Contact = (props) => (
  <Section {...props}>
    <Row style={{alignItems: 'center'}}>
      <Column xs={12} sm={6} style={{margin: '1em 0'}}>
        <Form />
      </Column>
      <Column xs={12} sm={6} style={{margin: '1em 0', textAlign: 'center'}}>
        <h2>Contact</h2>

        Jane Kim<br/>
        <a href="mailto:jane@theglamourist.com">jane@theglamourist.com</a><br/>
        <a href="tel:14158605872">(415) 860-5872</a>
      </Column>
    </Row>
  </Section>
)

export default styled(Contact)`
  img.map {
    width: 100%;
    filter: grayscale(50%);
  }
`

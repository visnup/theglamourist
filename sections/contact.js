import Section from '../components/section'
import { Row, Column } from '../components/grid'
import Input from '../components/input'
import Select from '../components/select'
import Textarea from '../components/textarea'
import DateInput from '../components/date-input'
import TimeInput from '../components/time-input'

const Contact = (props) => (
  <Section {...props}>
    <h1>Contact</h1>
    <Row>
      <Column xs={12} sm={6}>
        <form action="https://docs.google.com/forms/d/e/1FAIpQLSdMkgKEPDGBxO7FQFL2d2-Cac508piNbh4opXifr_FW_7Vp9A/formResponse">
          <label>
            <Row>
              <Column xs={12} sm={4}>Name</Column>
              <Column xs={12} sm={8}>
                <Input type="text" aria-label="Name" name="entry.1437799755" required />
              </Column>
            </Row>
          </label>

          <label>
            <Row>
              <Column xs={12} sm={4}>Email address</Column>
              <Column xs={12} sm={8}>
                <Input type="email" autocomplete="email" aria-label="Your email" name="emailAddress" required />
              </Column>
            </Row>
          </label>

          <label>
            <Row>
              <Column xs={12} sm={4}>Phone number</Column>
              <Column xs={12} sm={8}>
                <Input type="text" aria-label="Phone number" name="entry.576562644" required />
              </Column>
            </Row>
          </label>

          <label>
            <Row>
              <Column xs={12} sm={4}>Service type</Column>
              <Column xs={12} sm={8}>
                <Select name="entry.1662257326">
                  <option>Wedding</option>
                  <option>Commercial</option>
                  <option>Fashion</option>
                  <option>Lessons</option>
                  <option>Boudoir</option>
                  <option>Other</option>
                </Select>
              </Column>
            </Row>
          </label>

          <Row>
            <Column xs={12} sm={4}>
              <label>Event date</label>
            </Column>
            <Column xs={12} sm={8}>
              <DateInput name="entry.887843388" />
            </Column>
          </Row>

          <label>
            <Row>
              <Column xs={12} sm={4}>Event location</Column>
              <Column xs={12} sm={8}>
                <Input type="text" aria-label="Event location" name="entry.577337949" />
              </Column>
            </Row>
          </label>

          <Row>
            <Column xs={12} sm={4}>
              <label>What time will you need to be ready by?</label>
            </Column>
            <Column xs={12} sm={8}>
              <TimeInput name="entry.1056723364" />
            </Column>
          </Row>

          <label>
            <Row>
              <Column xs={12} sm={4}>Size of bridal party</Column>
              <Column xs={12} sm={8}>
                <Input type="text" name="entry.1752902834" />
              </Column>
            </Row>
          </label>

          <label>
            <Row>
              <Column xs={12} sm={4}>Please describe what you're looking for</Column>
              <Column xs={12} sm={8}>
                <Textarea name="entry.1525442277"></Textarea>
              </Column>
            </Row>
          </label>

          <Row>
            <Column xs={12} sm={4}></Column>
            <Column>
              <button>Send</button>
            </Column>
          </Row>
        </form>
      </Column>
      <Column xs={12} sm={6}>
        Hello
      </Column>
    </Row>
  </Section>
)

export default Contact

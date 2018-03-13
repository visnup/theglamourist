import Section from '../components/section'
import Input from '../components/input'
import Select from '../components/select'
import Textarea from '../components/textarea'

const Contact = () => (
  <Section>
    <h1>Contact</h1>
    <form action="https://docs.google.com/forms/d/e/1FAIpQLSdMkgKEPDGBxO7FQFL2d2-Cac508piNbh4opXifr_FW_7Vp9A/formResponse">
      <p>
        <label>
          Name<br/>
          <Input type="text" aria-label="Name" name="entry.1437799755" required />
        </label>
      </p>

      <p>
        <label>
          Email address<br/>
          <Input type="email" autocomplete="email" aria-label="Your email" name="emailAddress" required />
        </label>
      </p>

      <p>
        <label>
          Phone number<br/>
          <Input type="text" aria-label="Phone number" name="entry.576562644" required />
        </label>
      </p>

      <p>
        <label>
          Service type<br/>
          <Select name="entry.1662257326">
            <option>Wedding</option>
            <option>Commercial</option>
            <option>Fashion</option>
            <option>Lessons</option>
            <option>Boudoir</option>
            <option>Other</option>
          </Select>
        </label>
      </p>

      <p>
        <label>
          Event date<br/>
          <Input type="date" />
          <input type="hidden" name="entry.887843388_year" value="2018" />
          <input type="hidden" name="entry.887843388_month" value="3" />
          <input type="hidden" name="entry.887843388_day" value="15" />
        </label>
      </p>

      <p>
        <label>
          Event location<br/>
          <Input type="text" aria-label="Event location" name="entry.577337949" />
        </label>
      </p>

      <p>
        <label>
          What time will you need to be ready by?<br/>
          <Input type="time" step="900" />
        </label>
      </p>

      <p>
        <label>
          Size of bridal party<br/>
          <Input type="text" name="entry.1752902834" />
        </label>
      </p>

      <p>
        <label>
          Please describe what you're looking for<br/>
          <Textarea name="entry.1525442277"></Textarea>
        </label>
      </p>

      <button>Send</button>
    </form>
  </Section>
)

export default Contact

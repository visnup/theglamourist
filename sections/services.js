import Markdown from 'react-remarkable'
import styled from 'styled-components'
import Section from '../components/section'

const source = `
## Services

### Bridal

- Bridal packages begin at $1,000
- Elopments begin at $650
- Trial, Engagement sessions, Boudoir, Special Events $450

_Please inquire for detailed rates, packages, and policies_

### Commercial
Rates available upon request

### Lessons & Workshops

_One of our greatest gifts is to share our knowledge with others_

Please inquire about our private lessons, workshops, and mentorship programs
`

const Services = (props) => (
  <Section {...props}>
    <Markdown source={source} options={{html: true, typographer: true}} />
  </Section>
)

export default styled(Services)`
  h3, h4 {
    margin: 3em 0 0;
  }

  p {
    margin: .5em 0;
  }

  ul {
    padding-left: 20px;
  }

  li {
    list-style-type: square; 
  }
`

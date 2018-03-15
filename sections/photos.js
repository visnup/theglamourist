import styled from 'styled-components'
import Section from '../components/section'

const Photos = (props) => (
  <Section {...props}>
    <img src="/static/photos/donkeys.jpg" />
    <img src="/static/photos/elephants.jpg" />
    <img src="/static/photos/kittens.jpg" />
    <img src="/static/photos/koi.jpg" />
    <img src="/static/photos/lemurs.jpg" />
    <img src="/static/photos/tigers.jpg" />
  </Section>
)

export default styled(Photos)`
  height: 80vh;
  padding: 0;
  margin: 0;
  white-space: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
  overflow-scrolling: touch;
  scroll-snap-type: x mandatory;
  scroll-snap-destination: 50% 50%;

  img {
    height: 100%;
    margin: 0;
    scroll-snap-align: center;
  }
`

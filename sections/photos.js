import styled from 'styled-components'
import Section from '../components/section'

const Photos = (props) => (
  <Section {...props}>
    <img src="/static/photos/27878230_413955342373291_4665685564203204608_n.jpg" />
    <img src="/static/photos/27893084_171014887020535_2728928469332262912_n.jpg" />
    <img src="/static/photos/28151997_417089678744153_7321564065828962304_n.jpg" />
    <img src="/static/photos/25007066_923003567876044_1388286846299013120_n.jpg" />
    <img src="/static/photos/23668123_1603435529719419_490774200538103808_n.jpg" />
    <img src="/static/photos/27877883_756039844586619_299669991479836672_n.jpg" />
  </Section>
)

export default styled(Photos)`
  height: 85vh;
  padding: 0;
  padding-left: 15%;
  margin: 0;
  margin-top: 7em;
  white-space: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
  -webkit-overflow-scrolling: touch;
  scroll-snap-type: x mandatory;
  scroll-snap-destination: 50% 50%;

  img {
    height: 100%;
    margin: 0;
    scroll-snap-align: center;
  }
`

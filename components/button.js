import styled from 'styled-components'
import Input from './input'

export default styled(Input.withComponent('button'))`
  background-color: hsl(80, 33%, 82%);
  color: hsla(0, 0%, 0%, .7);
  padding-left: 1.5em;
  padding-right: 1.5em;

  @media (min-width: 64rem) {
    width: auto;
  }
`

import styled from 'styled-components'

export default styled.section`
  max-width: 64rem;
  margin: 0 auto;
  padding: 1em;

  h2 {
    text-transform: uppercase;
  }

  @media (min-width: 48rem) {
    padding: 2em;
  }

  @media (min-width: 64rem) {
    margin: 6em auto;
  }
`

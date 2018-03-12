import styled from 'styled-components'

// http://typecast.com/blog/a-more-modern-scale-for-web-typography
const Container = styled.main`
  max-width: 76rem;
  margin: 0 auto;
  font-family: 'Montserrat', sans-serif;
  font-size: 1em;
  line-height: 1.375em;

  h1, h2 {
    font-family: 'Cormorant Garamond', serif;
    font-weight: 400;
    font-style: italic;
  }

  h1 {
    font-size: 3em;
    line-height: 1.25;
  }

  h2 {
    font-size: 2.25em;
    line-height: 1.25;
  }

  h3 {
    font-size: 1.25em;
    line-height: 1.25;
  }

  h4 {
    font-size: 1em;
    line-height: 1.22222222;
  }
`

export default Container

import styled from 'styled-components'

// http://typecast.com/blog/a-more-modern-scale-for-web-typography
const Container = styled.main`
  max-width: 64rem;
  margin: 0 auto;
  font-family: 'Nunito', sans-serif;
  font-size: 1em;
  line-height: 1.375em;
  color: hsl(0, 0%, 30%);

  h1, h2, h3, h4, h5, h6 {
    margin-bottom: .5em;
  }

  h1, h2, h3 {
    font-family: 'Gotham SSm A', 'Gotham SSm B', serif;
    font-weight: 700;
    color: black;
  }

  h1 {
    font-size: 3em;
    line-height: 1.25;
    letter-spacing: -2px;
  }

  h2 {
    font-size: 2.25em;
    line-height: 1.25;
    text-transform: uppercase;
  }

  h3 {
    font-size: 1.25em;
    line-height: 1.25;
  }

  h4 {
    font-size: 1em;
    line-height: 1.22222222;
  }

  a {
    color: black;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }
`

export default Container

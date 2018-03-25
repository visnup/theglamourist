import styled from 'styled-components'

// http://type-scale.com/?size=16&scale=1.200&text=A%20Visual%20Type%20Scale&webfont=EB%2BGaramond%7CMontserrat%3A400%2C500%2C600%2C700&font-family=%22EB%20Garamond%22%2C%20serif&font-weight=400&font-family-headers=Montserrat%2C%20sans-serif&font-weight-headers=600&background-color=white&font-color=#333
const scale = 1.125
const Container = styled.main`
  max-width: 64rem;
  margin: 0 auto;
  font-family: 'Garamond', serif;
  font-weight: 400;
  font-size: 18px;
  line-height: 1.5;
  color: hsl(0, 0%, 10%);

  h1, h2, h3, h4, h5, h6 {
    font-family: 'Gotham SSm A', 'Gotham SSm B', sans-serif;
    font-weight: 500;
    line-height: 1.2;
    margin: 1.414em 0 .5em;
    color: black;
  }

  h1 {
    font-size: ${Math.pow(scale,4)}em;
    letter-spacing: -2px;
  }

  h2 {
    font-size: ${Math.pow(scale,3)}em;
  }

  h3 {
    font-size: ${Math.pow(scale,2)}em;
  }

  h4 {
    font-size: ${scale}em;
    font-weight: 400;
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

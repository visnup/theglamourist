import Head from 'next/head'
import styled from 'styled-components'

const Container = ({ className, children }) => (
  <main className={className}>
    <Head>
      <link rel="stylesheet" type="text/css" href="https://cloud.typography.com/6739094/7523572/css/fonts.css" />
      <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,700" rel="stylesheet" />
      <link href="https://unpkg.com/normalize.css@8.0.0/normalize.css" rel="stylesheet" />
    </Head>
    {children}
  </main>
)

// http://type-scale.com/?size=16&scale=1.200&text=A%20Visual%20Type%20Scale&webfont=EB%2BGaramond%7CMontserrat%3A400%2C500%2C600%2C700&font-family=%22EB%20Garamond%22%2C%20serif&font-weight=400&font-family-headers=Montserrat%2C%20sans-serif&font-weight-headers=600&background-color=white&font-color=#333
const scale = 1.125
export default styled(Container)`
  font-family: 'Garamond', 'EB Garamond', serif;
  font-weight: 400;
  font-size: 18px;
  line-height: 1.5;
  color: hsl(0, 0%, 40%);

  h1, h2, h3, h4, h5, h6 {
    font-family: 'Gotham SSm A', 'Gotham SSm B', sans-serif;
    font-weight: 500;
    line-height: 1.2;
    margin: 1.414em 0 .5em;
    color: hsl(0, 0%, 10%);
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

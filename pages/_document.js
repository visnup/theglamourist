import Document, { Head, Main, NextScript } from 'next/document'
import { ServerStyleSheet } from 'styled-components'

export default class MyDocument extends Document {
  static getInitialProps({ renderPage }) {
    const sheet = new ServerStyleSheet()
    const page = renderPage(App => props => sheet.collectStyles(<App {...props} />))
    const styleTags = sheet.getStyleElement()
    return { ...page, styleTags }
  }

  render() {
    return (
      <html lang="en">
        <Head>
          <title>The Glamourist - Jane Kim - Makeup Artist (San Francisco)</title>
          <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no" />
          <link rel="stylesheet" type="text/css" href="https://cloud.typography.com/6739094/7523572/css/fonts.css" />
          <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,700" rel="stylesheet" />
          <link href="https://unpkg.com/normalize.css@8.0.0/normalize.css" rel="stylesheet" />
          {this.props.styleTags}
          <meta name="description" content="Jane Kim, owner and founder of The Glamourist, is an award winning makeup artist and hair stylist based in San Francisco." />
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </html>
    )
  }
}

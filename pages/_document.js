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
      <html>
        <Head>
          <title>The Glamourist - Jane Kim - Makeup Artist (San Francisco)</title>
          <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no" />
          <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:400,400i|Nunito" rel="stylesheet" />
          <link href="https://unpkg.com/normalize.css@8.0.0/normalize.css" rel="stylesheet" />
          {this.props.styleTags}
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </html>
    )
  }
}

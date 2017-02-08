import React, { Component } from 'react';
import marked from 'marked'

let source = `
# I love empowering women through beauty.

A clumsy makeup artist, a new wife, daughter, sister and a mother to 2 furry
babies... I laugh a lot, find amusement in the random things, and Instagram
lot.

I’m a lover of simplicity, effortless style, clean design, and random
occurrences. You can often find me in false lashes, sipping on an iced coffee
or enjoying a refreshing glass of white wine. I enjoy a good weekend brunch,
great conversation, and even better company.

To know me is to love me so get to know me here.

Oh yea, puppies are my weakness.
`

class About extends Component {
  render() {
    return (
      <div className="container-fluid">
        <div dangerouslySetInnerHTML={{__html: marked(source)}}></div>
      </div>
    );
  }
}

export default About;

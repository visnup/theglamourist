import React, { Component } from 'react'
import css from './Services.css'
import marked from 'marked'

let source = `
## Rates & Policies

### Bridal Packages <span class="price header">Rates 2017</span>

Packages are designed with our bride's best interest in mind.

### The Essential Package (Hair & Makeup) <span class="price">1000</span>

  *Provides brides with the essential needs of hair and makeup for her big
  day.*

  - Hair & Makeup application (includes faux lashes)
  - Airbrushed foundation (optional)
  - Touch up kit (lip gloss, oil blotting papers, hair spray, etc.)

### The Radiant Package <span class="price">1800</span>

  *Ensures each bride peace of mind of her flawless beauty as she walks down
  the aisle.*

  - Trial Session (3hrs in-studio) - consultation, makeup & hair application
  - Hair & Makeup application (includes faux lashes)
  - Airbrushed foundation (optional)
  - Touch up and personal attendant services until start of ceremony
  - Travel up to two (2) locations is allowed (prep, ceremony) All locations
    must be within close proximity otherwise additional travel fee will
    apply.
  - Hair and makeup changes not allowed

### The Glamour Package <span class="price">2150</span>

  *The ultimate bridal pampering package and also the favorite of our brides.
  Ensures brides peace of mind.*

  - Trial Session (3hrs in-studio) - consultation, makeup & hair application
  - Wedding day makeup & hair application (includes faux lashes)
  - Makeup & hair style change
  - Airbrushed foundation (optional)
  - Touchup & personal attendant services (6hrs)
  - Personal assistance begins from once prep time ends
  - No split shifts allowed
  - Travel up to three (3) locations is allowed (prep, ceremony, reception).
    All locations must be within close proximity otherwise additional travel
    fee will apply.
  - *Recommended for cryers, difficult weather conditions, and oilier skin
    types*

### Trial Sessions <span class="price">450</span>

  - Hair & makeup consultation and application (includes faux lashes)
  - All sessions last 3 hours
  - In studio & weekdays only
  - On-location add 150+
  - *More details below*

### Engagement, Boudoir & Special Event Sessions <span class="price">300</span>

  - Hair & makeup application (includes faux lashes)
  - All sessions last 2 hours
  - In studio & weekdays only
  - On-location add 150+

### Destination Packages <span class="price">Upon Request</span>

### Bridal Party

  (*Maids, mothers, & other ladies*)

  - Hair <span class="price">125 / service</span>
  - Makeup <span class="price">125 / service</span>

### Jr. Bridesmaids / Flower Girls (3-12 years)
  - Hair <span class="price">75 / service</span>
  - Makeup <span class="price">75 / service</span>

### Add-On Services

  - Makeup Lessons <span class="price">300+ (*2 hrs*)</span>
  - Touchups <span class="price">150 / hr</span>
  - Faux eyelash application (a la carte) <span class="price">20</span>
  - Tattoo / Scar coverage <span class="price">75+</span>
  - Early start fee (rate based on number of hours prior to 8:00am) <span
    class="price">100+</span>
  - Parking (billed to room) <span class="price">Valet Rate / artist</span>
  - Workshops <span class="price">upon request</span>
  - Commercial / Production <span class="price">upon request</span>

### Travel Fees

  - Vary on location
  - Minimum rate may apply depending on travel radius, please inquire about
    your location

## Policies

  - **A signed contract and a non-refundable retainer of 50% is required to
    reserve a date**
  - A trial session does not ensure a booking
  - Availability changes instantaneously, early booking is highly recommended
  - Accommodations are required if travel exceeds 60 miles and start time is
    prior to 7:00am
  - Final service count must be submitted 30 days prior to event date to
    ensure proper staffing
  - For Destination Weddings, only The Glamour Package is available &
    airfare, accommodations, transportation & travel rate will apply.

## Trial Sessions

  - All trial sessions are held in-studio
  - Trial session location address: [Blu Bungalow, 2068 Union Street, San
    Francisco, CA 94123][1]
  - Trial sessions are held between Monday thru Thursday
  - It is highly recommended to bring at least 3 images for each hair and
    makeup look
  - Trial sessions are limited to one look for hair and makeup
  - All directions will be taken from the bride only and no other parties
    (i.e. mothers, bridesmaids etc.)
  - If you are more than 15 minutes late for your appointment(s) it may be
    cancelled or a late fee of $15 will be charged for every 15 minutes that
    have elapsed. Late fee will be collected once the service has been
    rendered.
  - Payment is collected once service has been rendered
  - Accepted forms of payment: cash, check, credit card & PayPal
    - For all credit card transactions, a transaction fee of 3.5% will apply
    - For PayPal payments, please process as "personal transaction"
  - Trial sessions are non-refundable

  *Rates subject to change without notice & are non-negotiable*

[1]: https://maps.google.com/maps?q=Blu+Bungalow&hl=en&ll=37.800188,-122.433314&spn=0.022109,0.033517&cid=15634673860134688280&gl=US&t=m&z=15&iwloc=A
`

class Services extends Component {
  render() {
    return (
      <div {...css}>
        <div className="container-fluid">
          <div className="row center-xs">
            <div className="col-sm-12 col-md-8 start-xs">
              <div dangerouslySetInnerHTML={{__html: marked(source)}}></div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default Services

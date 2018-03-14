import React, { Component } from 'react'
import styled from 'styled-components'

import { Row, Column } from '../components/grid'
import Input from '../components/input'
import Select from '../components/select'
import Textarea from '../components/textarea'
import DateInput from '../components/date-input'
import TimeInput from '../components/time-input'
import Button from '../components/button'

class Form extends Component {
  state = {
    sent: false
  }

  onSubmit = async (event) => {
    event.preventDefault()
    const form = event.target
    fetch(form.action, { method: 'POST', body: new FormData(form) })
    this.setState({ sent: true })
  }

  render() {
    const { sent } = this.state

    return (
      <form {...this.props} onSubmit={this.onSubmit} action="https://docs.google.com/forms/d/e/1FAIpQLSdMkgKEPDGBxO7FQFL2d2-Cac508piNbh4opXifr_FW_7Vp9A/formResponse">
        {sent && (
          <div className="Form__Thanks">
            <div>
              <h2>Thanks!</h2>
              <p>
                We'll get back to you soon.
              </p>
            </div>
          </div>
        )}

        <label>
          <Row>
            <Column xs={12} sm={4}>Name</Column>
            <Column xs={12} sm={8}>
              <Input type="text" aria-label="Name" name="entry.1437799755" required />
            </Column>
          </Row>
        </label>

        <label>
          <Row>
            <Column xs={12} sm={4}>Email address</Column>
            <Column xs={12} sm={8}>
              <Input type="email" autocomplete="email" aria-label="Your email" name="emailAddress" required />
            </Column>
          </Row>
        </label>

        <label>
          <Row>
            <Column xs={12} sm={4}>Phone number</Column>
            <Column xs={12} sm={8}>
              <Input type="text" aria-label="Phone number" name="entry.576562644" required />
            </Column>
          </Row>
        </label>

        <label>
          <Row>
            <Column xs={12} sm={4}>Service type</Column>
            <Column xs={12} sm={8}>
              <Select name="entry.1662257326">
                <option>Wedding</option>
                <option>Commercial</option>
                <option>Fashion</option>
                <option>Lessons</option>
                <option>Boudoir</option>
                <option>Other</option>
              </Select>
            </Column>
          </Row>
        </label>

        <Row>
          <Column xs={12} sm={4}>
            <label>Event date</label>
          </Column>
          <Column xs={12} sm={8}>
            <DateInput name="entry.887843388" />
          </Column>
        </Row>

        <label>
          <Row>
            <Column xs={12} sm={4}>Event location</Column>
            <Column xs={12} sm={8}>
              <Input type="text" aria-label="Event location" name="entry.577337949" />
            </Column>
          </Row>
        </label>

        <Row>
          <Column xs={12} sm={4}>
            <label>What time will you need to be ready by?</label>
          </Column>
          <Column xs={12} sm={8}>
            <TimeInput name="entry.1056723364" />
          </Column>
        </Row>

        <label>
          <Row>
            <Column xs={12} sm={4}>Size of bridal party</Column>
            <Column xs={12} sm={8}>
              <Input type="text" name="entry.1752902834" />
            </Column>
          </Row>
        </label>

        <label>
          <Row>
            <Column xs={12} sm={4}>Please describe what you're looking for</Column>
            <Column xs={12} sm={8}>
              <Textarea name="entry.1525442277"></Textarea>
            </Column>
          </Row>
        </label>

        <Row>
          <Column xs={12} sm={4}></Column>
          <Column>
            <Button>Send</Button>
          </Column>
        </Row>
      </form>
    )
  }
}

export default styled(Form)`
  position: relative;
  
  label {
    margin-top: 1em;
    display: block;
  }

  .Form__Thanks {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    background-color: hsla(0, 0%, 100%, .9);
  }
`

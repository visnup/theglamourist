import { range } from 'lodash'
import styled from 'styled-components'
import Select from './select'

const now = new Date()

const DateInput = ({ className, name }) => (
  <span className={className}>
    <Select name={`${name}_year`}>
      {[0, 1, 2, 3, 4, 5].map(i => (
        <option key={i}>{now.getFullYear() + i}</option>
      ))}
    </Select>
    {' '}
    <Select name={`${name}_month`}>
      <option value="1">January</option>
      <option value="2">February</option>
      <option value="3">March</option>
      <option value="4">April</option>
      <option value="5">May</option>
      <option value="6">June</option>
      <option value="7">July</option>
      <option value="8">August</option>
      <option value="9">September</option>
      <option value="10">October</option>
      <option value="11">November</option>
      <option value="12">December</option>
    </Select>
    {' '}
    <Select name={`${name}_day`}>
      {range(1, 32).map(d => (
        <option key={d}>{d}</option>
      ))}
    </Select>
  </span>
)

export default styled(DateInput)`
  select { width: auto }
`

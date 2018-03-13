import { range } from 'lodash'
import Select from './select'

export default ({ name }) => (
  <span>
    <Select name={`${name}_hour`}>
      {range(0,24).map(h => (
        <option value={h} key={h}>
          {h === 0 ? '12' : h < 13 ? h : h - 12} {h < 12 ? 'AM' : 'PM'}
        </option>
      ))}
    </Select>
    {' '}
    <Select name={`${name}_minute`}>
      <option>00</option>
      <option>15</option>
      <option>30</option>
      <option>45</option>
    </Select>
  </span>
)

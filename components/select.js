import Input from './input'

export default Input.withComponent('select').extend`
  appearance: none;
  background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg"><path d="M0,4L6,4L3,8Z" /></svg>') no-repeat 100% 50%;
  background-size: 12px 12px;
  padding-right: 15px;
`

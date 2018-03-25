import styled from 'styled-components'

export default styled.input`
  padding: 5px;
  border: none;
  border-bottom: solid 1px hsla(0, 0%, 0%, .2);
  border-radius: 0;
  width: 100%;
  box-sizing: border-box;

  &:focus {
    border-bottom-color: black;
    outline: none;
  }
`

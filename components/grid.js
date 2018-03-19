import styled from 'styled-components'

const breakpoints = [
  { name: 'xs', min: 0 },
  { name: 'sm', min: 48 },
  { name: 'md', min: 64 },
  { name: 'lg', min: 75 },
]

export const Row = styled.div`
  display: flex;
  flex-wrap: wrap;
  margin-left: -10px;
  margin-right: -10px;
  align-items: baseline;
`

export const Column = styled.div`
  box-sizing: border-box;
  padding-left: 10px;
  padding-right: 10px;
  flex-shrink: 0;

  ${props => breakpoints.map(bp => `
    @media (min-width: ${bp.min}rem) {
      width: ${props[bp.name] ? props[bp.name]/12*100 : 'auto'}%;
    }
  `)}
`
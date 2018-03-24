import styled from 'styled-components'

const gutter = 20

const breakpoints = [
  { name: 'xs', min: 0 },
  { name: 'sm', min: 48 },
  { name: 'md', min: 64 },
  { name: 'lg', min: 75 },
]

export const Row = styled.div`
  display: flex;
  flex-wrap: wrap;
  margin-left: -${gutter}px;
  margin-right: -${gutter}px;
  align-items: baseline;
`

export const Column = styled.div`
  box-sizing: border-box;
  padding-left: ${gutter}px;
  padding-right: ${gutter}px;
  flex-shrink: 0;

  ${props => breakpoints.map(bp => `
    @media (min-width: ${bp.min}rem) {
      width: ${props[bp.name] ? props[bp.name]/12*100 : 'auto'}%;
    }
  `)}
`

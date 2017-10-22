import React from 'react'
import { NavLink } from 'react-router-dom'

const BeersTile = props => {


  return(
    <tr>
      <td><NavLink to={`/beers/${props.id}`}>{props.beerName}</NavLink></td>
      <td>{props.brewery}</td>
      <td>{props.rating}</td>
    </tr>
  )
}



export default BeersTile

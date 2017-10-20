import React, { Component } from 'react'
import NewestBeersTile from '../Components/NewestBeersTile'
import TopBeersTile from '../Components/TopBeersTile'
import BeersIndex from '../Components/BeersIndex'
import { Route, Switch } from 'react-router-dom';


class Home extends Component {
  constructor(props) {
    super(props)
    this.state = {beers: []
    }
  }

    componentDidMount() {
    // fetch('http://api.brewerydb.com/v2/beers/?key=6e8622bccf5170704fa8452aab7efb48', { method: 'GET', mode: 'no-cors', format: 'json'})
    fetch('https://swapi.co/api/people')
      .then(response => {
        if (response.ok || response.type == 'opaque') {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return response.results;
      })
      .then(body => {
        body.forEach((object) => {
          this.setState({ beers: this.state.beers.concat(object) });
        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
    }

  render(){

    return(

      <div className='row'>
        <div>
          <ul>
            <input type='search' placeholder='Search'></input>
            <button className='button' type='button'>Search</button>
          </ul>
        </div>
        <div>
          <div className='small-6 columns top-beer'>
            <TopBeersTile
              beers={this.state.beers}
            />
          </div>
          <div className='small-6 columns new-beer'>
            <NewestBeersTile
              beers={this.state.beers}
            />
          </div>
        </div>
      </div>
    )
  }
}

export default Home

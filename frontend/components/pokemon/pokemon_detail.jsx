import React from 'react';
import {withRouter} from 'react-router';

const PokemonDetail = ({pokemonDetail, router}) => {
  debugger;
  let handleClick = () => router.push(`/pokemon/${pokemonDetail.id}`);
  return(
    <section className="pokemon-detail">
    <ul>
      <img src={pokemonDetail.image_url}/>
        <li><h2>{pokemonDetail.name}</h2></li>
        <li>Type: {pokemonDetail.type}</li>
        <li>Attack: {pokemonDetail.attack}</li>
        <li>Defense: {pokemonDetail.defense}</li>
        <li>Moves: &#34;{pokemonDetail.moves}&#34;</li>
      <section className="toys">
          <h3>Toys</h3>
        <ul className="toy-list">
          {pokemonDetail.toys}
        </ul>
      </section>
    </ul>
  </section>
);};

export default withRouter(PokemonDetail);

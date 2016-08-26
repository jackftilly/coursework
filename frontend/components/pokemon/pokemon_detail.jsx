import React from 'react';
import {withRouter} from 'react-router';
import ToyDetailContainer from './toy_detail_container';

const PokemonDetail = ({pokemonDetail, router}) => {
  let handleClick = () => router.push(`/pokemon/${pokemonDetail.id}`);
  let toys = [];
  if (pokemonDetail.toys) {
    toys = pokemonDetail.toys.map(toy => {
      return <li key={toy.id}>{toy.name}</li>;
    });
  }
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
          {toys}
        </ul>
      </section>
    </ul>
  </section>
);};

export default withRouter(PokemonDetail);

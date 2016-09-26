import React from 'react';
import {withRouter} from 'react-router';

const PokemonIndexItem = (props) => {
  let handleClick = () => props.router.push(`/pokemon/${pokemon.id}`);
  let pokemon = props.pokemon;
  return <li onClick={handleClick}><img src={pokemon.image_url} /><span>{pokemon.name}</span></li>;
};

export default withRouter(PokemonIndexItem);

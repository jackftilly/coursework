import React from 'react';
import PokemonIndexItem from './pokemon_index_item';


const PokemonIndex = ({ pokemon, children }) => {
  let pokemonItems = pokemon.map(poke => {
    return < PokemonIndexItem pokemon={poke} key={poke.id}  />;
  });
  return(
    <ul>
      {pokemonItems}
      { children }
    </ul>
  );
};

export default PokemonIndex;

import { receiveAllPokemon, PokemonConstants } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = [], action) => {
  switch(action.type) {
    case PokemonConstants.RECEIVE_ALL_POKEMON:
      return [...action.data];
    default:
      return state;
  }
};

export default pokemonReducer;

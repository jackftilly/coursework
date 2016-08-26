import { receivePokemon, PokemonConstants } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonDetailReducer = (state = {}, action) => {
  switch(action.type) {
    case PokemonConstants.RECEIVE_POKEMON:
    // debugger;
      return action.data;
    default:
      return state;
  }
};

export default pokemonDetailReducer;

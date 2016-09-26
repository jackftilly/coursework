import React from 'react';
import {fetchAllPokemon} from '../util/api_util';
import { PokemonConstants, requestAllPokemon, receiveAllPokemon} from '../actions/pokemon_actions';


const  pokemonMiddleware = state => next => action => {
  switch(action.type){
    case PokemonConstants.REQUEST_ALL_POKEMON:
      const success = data => state.dispatch(receiveAllPokemon(data));
      fetchAllPokemon(success);
      break;
    default:
      return next(action);
  }
};

export default pokemonMiddleware;

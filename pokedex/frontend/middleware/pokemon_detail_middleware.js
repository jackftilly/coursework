import React from 'react';
import { fetchPokemon } from '../util/api_util';
import { PokemonConstants, requestPokemon, receivePokemon } from '../actions/pokemon_actions';


const  pokemonDetailMiddleware = state => next => action => {
  switch(action.type){
    case PokemonConstants.REQUEST_POKEMON:
      const success = data => state.dispatch(receivePokemon(data));
      fetchPokemon(success, action.id);
      break;
    default:
      return next(action);
  }
};

export default pokemonDetailMiddleware;

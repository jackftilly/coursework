import React from 'react';
import {fetchToy} from '../util/api_util';
import { PokemonConstants, requestToy, receiveToy } from '../actions/pokemon_actions';


const  ToyDetailMiddleware = state => next => action => {
  switch(action.type){
    case PokemonConstants.REQUEST_TOY:
      const success = data => state.dispatch(receiveToy(data));
      fetchToy(success);
      break;
    default:
      return next(action);
  }
};

export default ToyDetailMiddleware;

import { receiveToy, PokemonConstants } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const toyDetailReducer = (state = {}, action) => {
  switch(action.type) {
    case PokemonConstants.RECEIVE_TOY:
      return action.data;
    default:
      return state;
  }
};

export default toyDetailReducer;

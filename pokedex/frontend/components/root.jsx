import { Router, Route, hashHistory } from 'react-router';
import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import {requestAllPokemon, requestPokemon} from '../actions/pokemon_actions';
import  PokemonDetailContainer  from './pokemon/pokemon_detail_container';


const Root = ({store}) => {
  const onEnterRequest = (nextState) => {
    store.dispatch(requestAllPokemon());
  };
  const requestPoke = (nextState) => {
    store.dispatch(requestPokemon(nextState.params.id));
  };
  window.store = store;
  return (
    <Provider store={store} >
      <Router history={hashHistory}>
        <Route path="/" component={PokemonIndexContainer} onEnter={onEnterRequest}>
          <Route path="pokemon/:id" component={PokemonDetailContainer} onEnter={requestPoke}>
          </Route>
        </Route>
      </Router>
    </Provider>
  );
};
export default Root;

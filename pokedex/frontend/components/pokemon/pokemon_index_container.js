import React from 'react';
import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index.jsx';
import { requestAllPokemon, receiveAllPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: state.pokemon
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon()),
  receiveAllPokemon: (data) => dispatch(receiveAllPokemon(data))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);

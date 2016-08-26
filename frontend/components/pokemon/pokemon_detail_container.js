import React from 'react';
import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail.jsx';
import { requestPokemon, receivePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemonDetail: state.pokemonDetail
});

const mapDispatchToProps = dispatch => ({
  requestPokemon: () => dispatch(requestPokemon()),
  receivePokemon: (data) => dispatch(receivePokemon(data))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

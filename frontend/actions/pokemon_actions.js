export const PokemonConstants = {
  RECEIVE_ALL_POKEMON: "RECEIVE_ALL_POKEMON",
  REQUEST_ALL_POKEMON: "REQUEST_ALL_POKEMON",
  REQUEST_POKEMON: "REQUEST_POKEMON",
  RECEIVE_POKEMON: "RECEIVE_POKEMON"
};

export function requestAllPokemon() {
  return ({
    type: PokemonConstants.REQUEST_ALL_POKEMON
  });
}


export function receiveAllPokemon(data) {
  return ({
    type: PokemonConstants.RECEIVE_ALL_POKEMON,
    data
  });
}


export function requestPokemon(id) {
  return ({
    type: PokemonConstants.REQUEST_POKEMON,
    id
  });
}


export function receivePokemon(data) {
  return ({
    type: PokemonConstants.RECEIVE_POKEMON,
    data
  });
}

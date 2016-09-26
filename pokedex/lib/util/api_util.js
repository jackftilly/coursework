export function fetchAllPokemon(success){
  $.ajax({
    method: "GET",
    url: "api/pokemon",
    success: success
  });
}

export function fetchPokemon(success, pokemonId) {
  $.ajax({
    methpd: "GET",
    url:`api/pokemon/${pokemonId}`,
    success
  });
}

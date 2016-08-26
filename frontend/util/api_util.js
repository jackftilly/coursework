export function fetchAllPokemon(success){
  $.ajax({
    method: "GET",
    url: "api/pokemon",
    success: success
  });
}

export function fetchPokemon(success, pokemonId) {
  $.ajax({
    method: "GET",
    url:`api/pokemon/${pokemonId}`,
    success
  });
}

export function fetchToy(success, toyId) {
  $.ajax({
    method: "GET",
    url:`api/toys/${toyId}`,
    success
  });
}

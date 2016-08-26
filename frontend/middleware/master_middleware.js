import {applyMiddleware} from 'redux';
import PokemonMiddleware from './pokemon_middleware';
import pokemonDetailMiddleware from './pokemon_detail_middleware';

const masterMiddleware =  applyMiddleware(PokemonMiddleware, pokemonDetailMiddleware);

export default masterMiddleware;

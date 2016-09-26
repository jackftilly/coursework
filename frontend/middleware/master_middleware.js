import {applyMiddleware} from 'redux';
import PokemonMiddleware from './pokemon_middleware';
import pokemonDetailMiddleware from './pokemon_detail_middleware';
import ToyDetailMiddleware from './toy_detail_middleware';

const masterMiddleware =  applyMiddleware(PokemonMiddleware, pokemonDetailMiddleware, ToyDetailMiddleware);

export default masterMiddleware;

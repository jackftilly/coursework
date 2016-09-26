import {NotesConstants} from "../actions/note_actions.js";
import _ from 'lodash';
import {NOTE_NAMES} from '../util/tones.js';


const validKeys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
const keyMap = {};
validKeys.forEach ((el, idx) => {
  keyMap[validKeys[idx]] = NOTE_NAMES[idx];
});

const notesReducer = (state = [], action) => {
  switch (action.type) {
    case "KEY_PRESSED":
      if(keyMap[action.key] && !state.includes(keyMap[action.key])) return [...state, keyMap[action.key]];
    case "KEY_RELEASED":
      if(keyMap[action.key]) {
        let key = action.key;
        let duped = (_.merge([], state));
        let releaseIndex = duped.indexOf(keyMap[action.key]);
        duped.splice(releaseIndex, 1);
        return duped;
      }
    default:
      return state;
  }
};

export default notesReducer;

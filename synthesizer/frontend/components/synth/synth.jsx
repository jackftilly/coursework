import React from 'react';
import { NOTE_NAMES, TONES } from '../../util/tones.js';
import Note from '../../util/note.js';
import $ from 'jquery';

class Synth extends React.Component {
  constructor(props) {
    super(props);
    this.notes = [];
    this.props = props;
    NOTE_NAMES.forEach ((note) => {
      this.notes.push(new Note(TONES[note]));
    });
  }

  onKeyDown(e) {
    let key = e.which - 48;
    key = key.toString();
    this.props.keyPressed(key);
  }
  onKeyUp(e) {
    let key = e.which - 48;
    key = key.toString();
    this.props.keyReleased(key);
  }

  playNotes() {
    NOTE_NAMES.forEach((note,idx) => {
      if (this.props.notes.includes(note)) {
        this.notes[idx].start();
      } else {
        this.notes[idx].stop();
      }
    });
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e));
  }

  render() {
    console.log(this.props);
    this.playNotes();
    let listItems = NOTE_NAMES.map((note) => {
      return <li key={note}>{note}</li>;
    });
    return (
      <ul>
        {listItems}
      </ul>
    );
  }
}

export default Synth;

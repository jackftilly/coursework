import React from 'react';
import { connect } from 'react-redux';
import ToyDetail from './toy_detail.jsx';
import { requestToy } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => ({
  toyDetail: state.toyDetail
});

const mapDispatchToProps = dispatch => ({
  requestToy: () => dispatch(requestToy()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ToyDetail);

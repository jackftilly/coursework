import React from 'react';
import {withRouter} from 'react-router';

const ToyDetail = ({toyDetail, router}) => {
  debugger
  return(
    <section className="toy-detail">
    <ul>
      <img src={toyDetail.image_url}/>
        <li><h2>{toyDetail.name}</h2></li>
        <li>Happiness: {toyDetail.happiness}</li>
        <li>Price: {toyDetail.price}</li>
    </ul>
  </section>
);};

export default withRouter(ToyDetail);

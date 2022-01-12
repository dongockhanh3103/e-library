import axios from 'axios';
import React, { useState, useEffect, Fragment } from 'react';
import Chip from '../../shared-components/chip/Chip';

const Combos = () => {
  const [combos, setCombos] = useState([]);

  useEffect(() => {
    axios.get('/v1/combos')
      .then(resp => {
        setCombos(resp.data.data);
      })
      .catch(error => {
        console.log(error);
      })
  }, [combos.length]);

  const list = combos.map((combo) => {
    const { book, song, label } = combo.attributes;
    return (
      <div key={combo.id} className="card pb-2 cols-sm" style={{width: '20rem'}}>
        <img className="card-img-top" src="https://townsquare.media/site/204/files/2021/06/Lady-A-What-a-song-can-do-album-art.jpg?w=1080&q=75" alt="Card image cap"></img>
        <div className="card-body">
          <h5 className="card-title">{book.name} + {song.name}<Chip label={label.name} /></h5>
        </div>
      </div>
    );
  });
  return(
    <Fragment>
      <div className="container">
        <h2>Combos</h2>
        <div className="row">
          {list}
        </div>
        <a type="button" href="/combos/create" className="btn btn-info mt-2">Create New Combo</a>
      </div>
    </Fragment>
  );
};

export default Combos;
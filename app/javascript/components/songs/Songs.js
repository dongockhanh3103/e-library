import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import Chip from '../../shared-components/chip/Chip';

const Songs = () => {
  const [songs, setSongs] = useState([]);
  useEffect(() => {
    // Get Songs from API
    axios.get('/v1/songs')
      .then(resp => {
        setSongs(resp.data.data)
      })
      .catch(error => {
        console.error(error)
      });
  }, [songs.length]);
  const list = songs.map((song) => {
    const { name, description, label } = song.attributes;
    return (
      <div key={name} className="card pb-2 cols-sm" style={{width: '20rem'}}>
        <img className="card-img-top" src="https://townsquare.media/site/204/files/2021/06/Lady-A-What-a-song-can-do-album-art.jpg?w=1080&q=75" alt="Card image cap"></img>
        <div className="card-body">
          <h5 className="card-title">{name}<Chip label={label.name} /></h5>
          {description && <p className="card-text">{description}</p>}
        </div>
      </div>
    );
  });

  return (
  <Fragment>
    <div className="container mt-5">
      <h2>Songs</h2>
      <div className="row">
        {list}
      </div>
      <a type="button" href="/songs/create" className="btn btn-info mt-2">Create New Song</a>
    </div>
  </Fragment>);
};

export default Songs;
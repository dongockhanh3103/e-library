import ReactDOM from 'react-dom';
import React, { useState, useEffect } from 'react';
import axios from 'axios';

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
    return (<li key={song.attributes.id}>{song.attributes.name} </li>);
  })
  return list;
};


export default Songs;
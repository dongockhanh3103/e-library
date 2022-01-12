import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import Chip from '../../shared-components/chip/Chip';

const Books = () => {
  const [books, setBooks] = useState([]);
  useEffect(() => {
    // Get Books from API
    axios.get('/v1/books')
      .then(resp => {
        setBooks(resp.data.data)
      })
      .catch(error => {
        console.error(error)
      });
  }, [books.length]);
  const list = books.map((book) => {
    const { name, description, label } = book.attributes;
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
    <div className="container">
      <h2>Books</h2>
      <div className="row">
        {list}
      </div>
      <a type="button" href="/books/create" className="btn btn-info mt-2">Create New Book</a>
    </div>
  </Fragment>);
};


export default Books;
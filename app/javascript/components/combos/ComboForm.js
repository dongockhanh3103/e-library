import axios from 'axios';
import React, { useState, useEffect } from 'react';

const ComboForm = () => {
  const [books, setBooks] = useState([]);
  const [songs, setSongs] = useState([]);
  const [labels, setLabels] = useState([]);
  const [book, setBook] = useState([]);
  const [song, setSong] = useState([]);
  const [label, setLabel] = useState([]);
  useEffect(() => {
    fetchBooks();
    fetchLabels();
    fetchSongs();
  }, [books.length, labels.length, songs.length]);

  const fetchBooks = () => {
    axios.get('/v1/books')
      .then(resp => {
        setBooks(resp.data.data);
      })
      .catch(error => {
        console.log(error);
      });
  }

  const fetchLabels = () => {
    axios.get('/v1/labels')
    .then(resp => {
      setLabels(resp.data.data);
    })
    .catch(error => {
      console.log(error);
    });
  }

  const fetchSongs = () => {
    axios.get('/v1/songs')
    .then(resp => {
      setSongs(resp.data.data);
    })
    .catch(error => {
      console.log(error);
    });
  }

  const bookOptions = initOptions(books);
  const songOptions = initOptions(songs);
  const labelOptions = initOptions(labels);
  function initOptions(items) {
    const options = items.map(item => {
      return(<option key={item.id} value={item.id}>{item.attributes.name}</option>)
    });

    return options;
  }

  const onChangeBook = (e) => {
    setBook(e.target.value);
  }

  const onChangeSong = (e) => {
    setSong(e.target.value);
  }

  const onChangeLabel = (e) => {
    setLabel(e.target.value);
  }

  const backDashboard = () => {
    window.location.href = '/';
  }

  const onSubmitForm = () => {
    const payload = {
      data: {
        attributes: {
          book_id: book,
          song_id: song,
          label_id: label
        }
      }
    };

    axios.post('/v1/combos', payload)
      .then(resp => {
        backDashboard();
      })
      .catch(error => {
        console.log(error);
      });
  }

  return(
    <div className="p-5">
      <h3>Combo form</h3>
      <div className="form-group">
        <label>Books</label>
        <select className="form-control" onChange={onChangeBook}>
          {bookOptions}
        </select>

        <label>Songs</label>
        <select className="form-control" onChange={onChangeSong}>
          {songOptions}
        </select>

        <label>Labels</label>
        <select className="form-control" onChange={onChangeLabel}>
          {labelOptions}
        </select>
      </div>
      <button type="button" onClick={backDashboard} className="btn btn-secondary mt-2">Back</button>
      <button type="button" onClick={onSubmitForm} className="btn btn-success mt-2 ml-2">Submit</button>
    </div>
  );
};

export default ComboForm;
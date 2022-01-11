import React from 'react';
import { Route, Routes } from 'react-router-dom';
import Books from './books/Books';
import Songs from './songs/Songs'

const App = () => {
  return (
    <Routes>
      <Route exact path="/" element={<Books />} ></Route>
      <Route exact path="/songs" element={<Songs />} ></Route>
    </Routes>
  );
};

export default App;
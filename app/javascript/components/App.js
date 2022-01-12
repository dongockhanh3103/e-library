import React from 'react';
import { Route, Routes } from 'react-router-dom';
import Books from './books/Books';
import Songs from './songs/Songs';
import Dashboard from './dashboard/Dashboard';
import ComboForm from './combos/ComboForm';
import LibraryForm from '../shared-components/library-form/LibraryForm';

const App = () => {
  return (
    <Routes>
      <Route exact path="/" element={<Dashboard />} ></Route>
      <Route exact path="/songs" element={<Songs />} ></Route>
      <Route exact path="/books" element={<Books />} ></Route>
      <Route exact path="/books/create" element={<LibraryForm type={'books'} />} ></Route>
      <Route exact path="/songs/create" element={<LibraryForm type={'songs'} />} ></Route>
      <Route exact path="/labels/most_popular" element={<LibraryForm type={'songs'} />} ></Route>
      <Route exact path="/combos/create" element={<ComboForm />} ></Route>
    </Routes>
  );
};

export default App;
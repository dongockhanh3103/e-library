import React from 'react';
import Books from '../books/Books';
import Songs from '../songs/Songs';
import MostPopular from '../labels/MostPopular';
import Combos from '../combos/Combos';
import SearchLabel from '../labels/SearchLabel';
import './styles.scss';

const Dashboard = () => {
  return(
  <div className="p-5">
    <h1 className="text-center">E-Library</h1>
    <SearchLabel />
    <MostPopular />
    <Combos />
    <Books />
    <Songs />
  </div>);
};

export default Dashboard;
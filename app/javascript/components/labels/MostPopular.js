import axios from 'axios';
import React, { useState, useEffect } from 'react';

const MostPopular = () => {
  const [labels, setLabels] = useState([]);

  useEffect(() => {
    axios.get('v1/labels/most_popular')
      .then(resp => {
        setLabels(resp.data.data);
    }).catch(err => {
      console.log(err);
    })
  }, [labels.length]);
  return(
    <div className="container mb-3">
      <ul className="list-group">
        <li className="list-group-item active">Most Popular Labels</li>
        {labels.map(label => {
          return <li key={label.id} className="list-group-item">{label.attributes.name}</li>
        })}
      </ul>
    </div>
  );
};

export default MostPopular;
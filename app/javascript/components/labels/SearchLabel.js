import axios from 'axios';
import React, { useState } from 'react';
import Chip from '../../shared-components/chip/Chip';

const SearchLabel = () => {
  const [type, setType] = useState('book');
  const [label, setLabel] = useState(null);

  const onSearch = (e) => {
    axios.get(`/v1/labels/search?data[attributes][term]=${e.target.value}&data[attributes][search_by]=${type}`)
      .then(resp => {
        setLabel(resp.data.data);
      })
      .catch(error => {
        console.log(error);
      })
  };

  const onChangeType = (e) => {
    setType(e.target.value);
  };

  return(
    <div className="container mb-3">
      <div className="row">
        <div className="cols-sm">
          <input type="text" className="form-control mb-3" onChange={onSearch} id="name" placeholder="Search" />
        </div>
        <div className="cols-sm">
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="searchType" id="inlineRadio1" onChange={onChangeType} value="book" />
            <label className="form-check-label" >Book</label>
          </div>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="searchType" onChange={onChangeType} value="song"/>
            <label className="form-check-label" >Song</label>
          </div>
          <div className="form-check form-check-inline">
            <input className="form-check-input" type="radio" name="searchType" onChange={onChangeType} value="combo" />
            <label className="form-check-label" >Combo</label>
          </div>
        </div>
      </div>
      
      <div>
        { label && <Chip label={label.attributes.name} /> }
      </div>
    </div>
  )
};

export default SearchLabel;
import React, { useEffect, useState } from 'react';
import axios from 'axios'
import './styles.scss';

const LibraryForm = ({ type }) => {
  const [labels, setLabels] = useState([]);
  const [name, setName] = useState('');
  const [label, setLabel] = useState(null);
  const [description, setDescription] = useState('');

  useEffect(() => {
    axios.get('/v1/labels')
      .then((resp) => {
        const { data } = resp;
        setLabels(data.data);        
      })
      .catch(error => {
        console.log(error);
      });
  }, [labels.length]);

  const labelOptions = labels.map(lb => {
    return(<option key={lb.id} value={lb.id}>{lb.attributes.name}</option>)
  });

  const onSubmitForm = () => {
    const payload = {
      data: {
        attributes: {
          name: name,
          description: description,
          label_id: label
        }
      }
    }
    axios.post(`/v1/${type}`, payload).then(resp => {
      window.location.href = '/';
    });
  }

  const onChangeName = (e) => {
    setName(e.target.value);
  }

  const onChangeDescription = (e) => {
    setDescription(e.target.value);
  }

  const onChangeLabel = (e) => {
    setLabel(e.target.value);
  }

  const backDashboard = () => {
    window.location.href = '/';
  }

  return(
    <form className="create-form">
      <h4>{type} Form</h4>
      <div className="form-group p-10">
        <label>Name</label>
        <input type="text" className="form-control" onChange={onChangeName} id="name" placeholder="name" />
        <div className="form-group">
          <label>Labels</label>
          <select className="form-control" onChange={onChangeLabel}>
            {labelOptions}
          </select>
        </div>

        <div className="form-group">
          <label>Description</label>
          <textarea onChange={onChangeDescription} className="form-control" id="description" rows="3"></textarea>
        </div>
      </div>
      <button type="button" onClick={backDashboard} className="btn btn-secondary mt-2">Back</button>
      <button type="button" onClick={onSubmitForm} className="btn btn-success mt-2 ml-2">Submit</button>
    </form>
  );
};

export default LibraryForm;
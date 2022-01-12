import React from 'react';
import './styles.css'

const Chip = ({ label }) => {
  return(
    <div className="chip">
      {label}
    </div>
  );
};

export default Chip;

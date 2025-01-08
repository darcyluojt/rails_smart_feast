import React from 'react';

export const SpecialRequest = () => {
  const generalList = ['Gluten Free', 'Nut Free', 'Dairy Free', 'Vegan', 'Vegetarian','Other'];
  const OtherRequest = (event) => {
    // if user selects other, a text box will appear for user to input their request
    if (event.target.value === 'Other') {
      const input = document.createElement('input');
      input.type = 'text';
      input.placeholder = 'Please specify your request';
      document.querySelector('.special_request').appendChild(input);
    }}

  return (
    <div className="special_request">
      <p><strong>Special Request: </strong></p>
      <select onChange={OtherRequest}>
        {generalList.map((item, index) => (
          <option key={index} value={item}>{item}</option>
        ))}
      </select>
    </div>
  );
}

import PropTypes from 'prop-types';
import React, {useReducer} from 'react';
// import {function} from reducer
// import * as style from
function Recipe({ initialData, profile }) {
  const [recipe, dispatch] = useReducer(recipeReducer, initialData.recipe);
  console.log('in recipe.jsx')
  return (
    <div>
      <h1>{recipe.name}</h1>

    </div>
  );
};

export default Recipe;

import React from 'react';
const recipeReducer = (state = {}, action) => {
  switch (action.type) {
    case 'SET_RECIPE_DATA':
      return {
        ...state,
        recipe: action.payload.recipe,
        profiles: action.payload.profiles,
        // selectedProfile: []
      };
    default:
      return state;
  }
};

export default recipeReducer;

// import { combineReducers } from 'redux';

const initialState = {
  recipe: initialData.recipe,
  profiles: profiles }

export default function recipeReducer (state=initialState,action) {
  switch (action.type) {
    case 'UPDATE_RECIPE':
      return action.payload; // Replace the entire recipe
    default:
      return state;
  }
};

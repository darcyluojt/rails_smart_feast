import React from 'react';
import { Provider } from 'react-redux';

import store from '../stores/recipeStore';
import RecipeContainer from '../containers/RecipeContainer'

// See documentation for https://github.com/reactjs/react-redux.
// This is how you get props from the Rails view into the redux store.
// This code here binds your smart component to the redux store.
const Recipe = (props) => (
  <Provider store={store}>
    <RecipeContainer />
  </Provider>
);

export default Recipe;

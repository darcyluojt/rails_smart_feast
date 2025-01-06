import { combineReducers } from 'redux'
import recipeReducer from './recipeReducer'
import React from 'react';
const rootReducer = combineReducers({
  recipe: recipeReducer
})

export default rootReducer

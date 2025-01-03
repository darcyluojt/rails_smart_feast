import { configureStore } from '@reduxjs/toolkit'
import recipeReducer from '../reducers/recipeReducer';

const store = configureStore({
  reducer: {
    recipe: recipeReducer
  }
});
console.log(store.getState());
export default store;

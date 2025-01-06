import { configureStore } from '@reduxjs/toolkit'
import recipeReducer from '../reducers/recipeReducer';
import React from 'react';
export const configureRecipeStore = (railsProps) => {
  return configureStore({
    reducer: {
      recipe: recipeReducer
    },
    preloadedState: {
      recipe: {
        recipe: railsProps.recipe,
        profiles: railsProps.profiles
      }
    }
  });
};

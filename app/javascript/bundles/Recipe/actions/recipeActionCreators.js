import React from 'react';

export const updateRecipe = (updates) => ({
  type: 'SET_RECIPE_DATA',
  payload: updates
});

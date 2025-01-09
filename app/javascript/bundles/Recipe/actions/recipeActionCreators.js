import React from 'react';

export const updateRecipe = (updates) => ({
  type: 'SET_RECIPE_DATA',
  payload: updates
});

export const updateSelectedProfile = (profileId) => ({
  type: 'UPDATE_SELECTED_PROFILE',
  payload: profileId
});

export const updateSpecialRequests = (specialRequests) => ({
  type: 'UPDATE_SPECIAL_REQUESTS',
  payload: specialRequests
});

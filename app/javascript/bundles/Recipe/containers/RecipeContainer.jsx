import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import Recipe from '../components/Recipe';
import * as actions from '../actions/recipeActionCreators';

const RecipeContainer = () => {
  const recipe = useSelector(state => state.recipe.recipe);
  const profiles = useSelector(state => state.recipe.profiles);
  const selectedProfileId = useSelector(state => state.recipe.selectedProfileId);
  const dispatch = useDispatch();

  // Functions to call the action creators
  const handleProfileSelect = (profileId) => {
    dispatch(actions.updateSelectedProfile(profileId));}

  const handleIngredientsUpdate = (updates) => {
    dispatch(actions.updateRecipe(updates));
  };


  return <Recipe
  recipe={recipe}
  profiles={profiles}
  selectedProfileId={selectedProfileId}
  onProfileSelect={handleProfileSelect}
 />;
}

export default RecipeContainer;

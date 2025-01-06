import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import Recipe from '../components/Recipe';
import * as actions from '../actions/recipeActionCreators';

const RecipeContainer = () => {
  const recipe = useSelector(state => state.recipe.recipe);
  const profiles = useSelector(state => state.recipe.profiles);
  const dispatch = useDispatch();

  // Example function to handle recipe updates
  const handleRecipeUpdate = (updates) => {
    dispatch(actions.updateRecipe(updates));
  };

  return <Recipe recipe={recipe} profiles={profiles} handleRecipeUpdate={handleRecipeUpdate} />;
}

export default RecipeContainer;

import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { ProfilesList } from './ProfilesList';
import { IngredientsList } from './IngredientsList';
import { SpecialRequest } from './SpecialRequest';
import {
  updateRecipe,
  updateSelectedProfile
  } from '../actions/recipeActionCreators';



const Recipe = ({ recipe, profiles, selectedProfileId, onProfileSelect }) => {

  if (!recipe) return <div>Loading...</div>;
  const recipeData = recipe.recipe;
  return (
    <div className="recipe_container">
      <IngredientsList ingredients={recipeData.ingredients_recipes} />
      {/* a border line to cut the content */}
      <hr />
      <ProfilesList profiles={profiles} selectedIds={selectedProfileId}
      onSelect={onProfileSelect} />
      <hr />
      <SpecialRequest />
      {/* <SubmitButton /> */}

    </div>
  )

}

export default Recipe;

import React from 'react';

const Recipe = ({ recipe, handleRecipeUpdate }) => {
  const recipeData = recipe.recipe;
  const categories = recipeData.category;
  const profileData = recipe.profiles;
  if (!recipe) return <div>Loading...</div>;

  return (
    <div>
      {categories}
      <div className='border card'>
        <h3>Add {recipeData.name} to your cooking plan</h3>
        <h4>Whom are you cooking for?</h4>
        <select>
          {profileData.map(profile => (
            <option key={profile.id} value={profile.id}>{profile.name}</option>
          ))}
        </select>
        <h4>When are you cooking?</h4>
        <input type='date' />
        <button onClick={() => handleRecipeUpdate({ profile_id: 1, date: '2021-01-01' })}>Add to plan</button>
      </div>
      <div>
        <h2>Ingredients:</h2>
        {recipeData.ingredients_recipes?.map(ir => (
          <div key={ir.id}>
            {ir.ingredient.name} - {ir.quantity} {ir.unit}
          </div>
        ))}
      </div>
    </div>
  );
}

export default Recipe;

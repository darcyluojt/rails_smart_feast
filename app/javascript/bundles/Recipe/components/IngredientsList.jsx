import React from 'react';

export const IngredientsList = (ingredients) => {
  const ingredientsData = ingredients.ingredients;
  return (
    <div className="ingredients_list">
      <h2>Ingredients</h2>
      {Object.values(ingredientsData).map(element => (
        <div key={element.id}>
          {element.ingredient.name} - {element.quantity} {element.unit}
        </div>
      ))}
    </div>
  );
}

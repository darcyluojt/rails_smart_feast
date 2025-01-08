import React from 'react';
export const RecipeHeader = ({ recipe }) => {
  const steps = recipe.steps.split('\n')
  const categoryBadges = recipe.category.map(name => (
    `<span className="badge badge-primary">${name}</span>`
  ))
  const categoryHtml = categoryBadges.toString()
  console.log(categoryHtml)
  return (
    <div className="recipe_header">
      <h1>{recipe.name}</h1>
      <img src={recipe.thumbnail} />
      {/* list categories */}
      {categoryHtml}
      <h2>Steps</h2>
      <ol>
        {steps.map((step, index) => (
          <li key={index}>{step}</li>
        ))}
      </ol>
    </div>
  );
}

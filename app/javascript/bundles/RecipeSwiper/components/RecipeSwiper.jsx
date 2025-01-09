import PropTypes from 'prop-types';
import React from 'react';
import * as style from './RecipeSwiper.module.css';
import { useSwipeable } from 'react-swipeable';

const RecipeSwiper = ({ initialRecipe, nextUrl }) => {
  // const handlers = useSwipeable({
  //   onSwipedLeft: () => console.log('swiped left'),
  //   onSwipedRight: () => console.log('swiped right'),
  //   preventDefaultTouchmoveEvent: true,
  //   trackMouse: true
  // });

  const categories = Object.values(initialRecipe.category).join(', ');
  const main = initialRecipe.ingredients_recipes.slice(0,6)
  const ingredients = main.map(element => element.ingredient.name).join(', ');
  const link = `/recipes/${initialRecipe.id}`;

  return (
    <a href={link} className="group relative block bg-black">
    {/* <div {...handlers}> */}
    <img
    alt=""
    src={initialRecipe.thumbnail}
    className="absolute inset-0 h-full w-full object-cover opacity-75 transition-opacity group-hover:opacity-50"/>
  <div className="relative p-4 sm:p-6 lg:p-8">
    <p className="text-sm font-medium uppercase tracking-widest text-pink-500">{categories}</p>

    <p className="text-xl font-bold text-white sm:text-2xl">{initialRecipe.name}</p>

    <div className="mt-32 sm:mt-48 lg:mt-64">
      <div
        className="translate-y-8 transform opacity-0 transition-all group-hover:translate-y-0 group-hover:opacity-100"
      >
        <p className="text-sm text-white"><strong>Main ingredients: </strong>{ingredients}</p>
        <p className="text-sm text-white">
        <strong>Instructions: </strong>{ingredients}{initialRecipe.steps.substring(0, initialRecipe.steps.indexOf('.') + 1)}......
        </p>
      </div>
    </div>
  </div>
    {/* </div> */}
    </a>
  )

};


export default RecipeSwiper;

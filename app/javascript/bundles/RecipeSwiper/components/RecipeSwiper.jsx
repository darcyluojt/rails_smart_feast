import PropTypes from 'prop-types';
import React, { useState }  from 'react';
import * as style from './RecipeSwiper.module.css';
import { useSwipeable } from 'react-swipeable';
import { current } from '@reduxjs/toolkit';

const RecipeSwiper = ({ initialRecipe, nextUrl }) => {
  const [currentRecipe, setCurrentRecipe] = useState(initialRecipe);

  const fetchNextRecipe = () => {
    console.log('left: fetching next recipe');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    fetch(nextUrl, {
      method: 'GET',
      headers: {
        'X-CSRF-Token': csrfToken
      }
    })
      .then(response => response.json())
      .then(newRecipe => {
        console.log(newRecipe);
        setCurrentRecipe(newRecipe);
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }

  const createMeal = (recipe) =>{
    console.log('right: creating meal');

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    fetch('/meals', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({
        meal: {
          recipe_id: recipe.id,
          date: new Date()
        }
      })
    })
    .then(response => response.json())
    .then(data => {
      console.log('Success:', data);
    })
  }

  const handlers = useSwipeable({
    onSwipedLeft: () => fetchNextRecipe(),
    onSwipedRight: ()=>createMeal(currentRecipe),
    preventDefaultTouchmoveEvent: true,
    trackMouse: true
  });

  const categories = Object.values(currentRecipe.category).join(', ');
  const main = currentRecipe.ingredients_recipes.slice(0,6)
  const ingredients = main.map(element => element.ingredient.name).join(', ');
  const link = `/recipes/${currentRecipe.id}`;
  const style= {
      backgroundImage: `url(${currentRecipe.thumbnail}), linear-gradient(rgba(0,0,0,1), rgba(0,0,0,0.5))`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
      backgroundRepeat: 'no-repeat',
      height: "75vh",
      width: '100%',
      margin: '8px auto',
      borderRadius: '15px',
      hover: 'hover:bg-gray-100',
      shadow: '0 4px 6px 0 rgba(0, 0, 0, 0.1)',
      border: '1px solid #e5e7eb',
      transition: 'all 0.3s',
      maxWidth: '460px',
      maxHeight: '920px',
    }

    const linkStyle = {
      // flexbox
      display: 'flex',
      justifyContent: 'space-between',
      flexDirection: 'column',
    }

  return (
    <div {...handlers} style={style}>
      <a href={link}  className="recipe-card group relative block h-full
      mx-4 sm:mx-8 overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300" style={linkStyle}>
        <div className="relative p-4 sm:p-6 lg:p-8">
          <p className="text-xl font-bold text-white sm:text-2xl text-center drop-shadow-xl">{currentRecipe.name}</p>
          <p className="text-sm font-medium uppercase tracking-widest  text-pink-500 w-full flex justify-center">{categories}</p>

        </div>
        {/* <div className="mt-32 sm:mt-48 lg:mt-64"> */}
        {/* <div
        // className="p-4 text-black sm:p-6 lg:p-8 overflow-hidden" style={{background: 'rgba(0,0,0,0.4)'}}> */}
        <div
        className="p-4 text-black sm:p-6 lg:p-8 overflow-hidden bg-opacity-50">

          <p className="text-sm text-white drop-shadow-xl"><strong>Main ingredients: </strong></p>
          <p className="text-sm text-white drop-shadow-xl">{ingredients}</p>
          <br/>
          <p className="text-sm text-white drop-shadow-lg shadow-black">
          <strong>Instructions: </strong>{ingredients}{currentRecipe.steps.substring(0, currentRecipe.steps.indexOf('.') + 1)}......
          </p>
          <br/>
        </div>
      </a>
    </div>
  )

};


export default RecipeSwiper;

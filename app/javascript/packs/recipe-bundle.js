import ReactOnRails from 'react-on-rails'
import RecipeApp from '../bundles/Recipe/startup/RecipeApp'


// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({Recipe: RecipeApp})

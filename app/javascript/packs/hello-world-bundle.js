import ReactOnRails from 'react-on-rails';

import HelloWorldApp from '../bundles/HelloWorld/startup/HelloWorldApp';
import Recipe from '../bundles/Recipe/components/Recipe';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorldApp,
});
// ReactOnRails.register({
//   Recipe,
// });

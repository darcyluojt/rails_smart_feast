import { connect } from 'react-redux';
import Recipe from '../components/Recipe';
import * as actions from '../actions/recipeActionCreators';

const mapStateToProps = (state) => (
  { recipe: state.recipe}

)
export default connect()

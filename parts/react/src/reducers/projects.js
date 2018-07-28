import initialState from './initialState';
import {
  // START_FETCH_PROJECT,
  // FETCH_PROJECT_SUCCESS,
  // FETCH_PROJECT_FAILURE,
  // SET_PAGE_NUMBER,
  SET_LANGUAGE,
  SET_SEARCH,
} from '../actions/Projects';


export default (state=initialState, action) => {
  switch (action.type) {
    case SET_LANGUAGE:  
      if(action.payload === null)  return state;
      return { ...state, language: action.payload.value};
    case SET_SEARCH:
      return { ...state, search: action.payload};        
    // case SET_PAGE_NUMBER:
    //   return { ...state, page: action.payload.selected};    
    // case START_FETCH_PROJECT:
    //   return { 
    //     ...state,
    //     fetching: true      
    //   };  
    // case FETCH_PROJECT_SUCCESS:
    //   return { 
    //     ...state,
    //     fetched: true, 
    //     total_count: action.payload.data.total_count,
    //     items: action.payload.data.items         
    //   };

    // case FETCH_PROJECT_FAILURE:
    //   return { 
    //     ...state, 
    //     error: action.payload          
    //   };
    default: return state;           
  }
};

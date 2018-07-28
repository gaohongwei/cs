// import axios from 'axios';
// import {full_url} from '../helper/helper.js'

// const START_FETCH_PROJECT = 'START_FETCH_PROJECT';
// const FETCH_PROJECT_SUCCESS = 'FETCH_PROJECT_SUCCESS';
// const FETCH_PROJECT_FAILURE = 'FETCH_PROJECT_FAILURE';
// const SET_PAGE_NUMBER = 'SET_PAGE_NUMBER'
const SET_SEARCH = 'SET_SEARCH'
const SET_LANGUAGE = 'SET_LANGUAGE'

// const startFetchProject = () => {
//   return {
//     type: START_FETCH_PROJECT
//   };
// };

// const fetchProjectSuccess = (response) => {
//   return {
//     type: FETCH_PROJECT_SUCCESS,
//     payload: response
//   };
// };

// const fetchProjectFailure = (error) => {
//   return {
//     type: FETCH_PROJECT_FAILURE,
//     payload: error
//   };
// };

// const fetchProjects = (search, language, page) => {
//   return function (dispatch) {
//     if (search === '') return 
//     dispatch(startFetchProject()); 
//     let url = full_url(search, language, page)   
//     console.log('url:', url)
//     axios.get(url)
//     .then((response) => {
//       console.log('response:', response)
//       dispatch(fetchProjectSuccess(response));
//     })
//     .then((error) => {   
//       dispatch(fetchProjectFailure(error));
//     });
//   };
// };

// const setPageNumber = (page) => {
//   return {
//     type: SET_PAGE_NUMBER,
//     payload: page
//   };
// }
const setSearch = (search_value) => {
  return {
    type: SET_SEARCH,
    payload: search_value
  };
}

const setLanguage = (payload) => {
  console.log('language:', payload)
  return {
    type: SET_LANGUAGE,
    payload
  };
}

export {
  // START_FETCH_PROJECT,
  // FETCH_PROJECT_SUCCESS,
  // FETCH_PROJECT_FAILURE,
  // SET_PAGE_NUMBER,  
  SET_SEARCH,
  SET_LANGUAGE,
  // fetchProjects,
  // setPageNumber,
  setSearch,
  setLanguage
};

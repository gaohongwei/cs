// import React from 'react';
// import ReactDOM from 'react-dom';
// import './styles/index.css';
// import App from './App';
// import registerServiceWorker from './registerServiceWorker';

// ReactDOM.render(<App />, document.getElementById('root'));
// registerServiceWorker();


import { applyMiddleware, createStore } from 'redux';
import logger from 'redux-logger';
import axios from 'axios';

const initialState = () => {
  return {
    search: 'ruby',
    language: 'ruby',
    fetching: false,
    fetched: false, 
    data: [],   
    page: 0, 
    count: 0,
    rows: []
  }
}

const reducer = function(state=initialState(), action){
  //let return 1;
  switch(action.type){
    case 'SEARCH':
      return Object.assign(state, {search: action.payload} );
      break;
    case 'LANGUAGE':
      return Object.assign(state, {language: action.payload} );
      break; 
    case 'PAGE':
      return Object.assign(state, {page: action.payload} );
      break;
    case 'FETCH_START':
      return Object.assign(state, {fetching: true} );
      break; 
    case 'FETCH_DONE':
      return Object.assign(state,
          {
            fetched: true, 
            fetching: false,
            data: action.payload          
          } 
        );
      break; 
    case 'FETCH_ERROR':
      return Object.assign(state, 
        {
        fetching: false,
        error: action.payload          
        }

        );
      break;       
  }
}

const middleware = applyMiddleware(logger)
const store = createStore(reducer,middleware);
const url = 'https://api.github.com/search/repositories?q=ruby'
// store.subscribe(() => {
//   console.log('state changed to:', store.getState())
// })

let changed = {type: 'SEARCH', payload: 'new search'}
store.dispatch(changed);

changed = {type: 'LANGUAGE', payload: 'shell'}
store.dispatch(changed);

changed = {type: 'PAGE', payload: 2}
store.dispatch(changed);

store.dispatch((dispatch)=>{
 dispatch({type: 'FETCH_START'})
 axios.get(url)
 .then((response) => {
  dispatch({type: 'FETCH_DONE', payload: response.data})  
 })
 .catch((err) => {
  dispatch({type: 'FETCH_ERROR', payload: err})
 })
});


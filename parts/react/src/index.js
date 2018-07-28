// import React from 'react';
// import ReactDOM from 'react-dom';
// import './styles/index.css';
// import App from './App';
// import registerServiceWorker from './registerServiceWorker';

// ReactDOM.render(<App />, document.getElementById('root'));
// registerServiceWorker();
import React from 'react'
import { render } from 'react-dom'
import {createStore, applyMiddleware} from 'redux';  
import logger from 'redux-logger';  
import thunk from  'redux-thunk';

import { Provider } from 'react-redux'
import App from './components/App'
import rootReducer from './reducers'

const store = createStore(rootReducer, applyMiddleware(thunk, logger))

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
)
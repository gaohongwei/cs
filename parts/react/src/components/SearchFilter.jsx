import React from 'react';
import Select from 'react-select';
import SearchInput from 'react-search-input'
import PropTypes from 'prop-types';

import {LANG_OPTIONS} from '../helper/helper.js'

SearchFilter.propTypes = {
  search:        PropTypes.string.isRequired,
  language:      PropTypes.string.isRequired,
  setLanguage: PropTypes.func.isRequired,
  setSearch: PropTypes.func.isRequired
}

export default function SearchFilter(props) {
  var options = LANG_OPTIONS
  return (
    <div> 
      <SearchInput  
        className="search-input" 
        placeholder = {'Search ...'}
        value = {props.search} 
        onChange={props.setSearch} />   
      <Select 
        className="select-input"       
        placeholder = {'Select Language'}
        value=    {props.language}
        onChange= {props.setLanguage}
        options=  {options}
      /> 
    </div>  );
}
import React from 'react';
//import Select from 'react-select';
import PropTypes from 'prop-types';
import axios from 'axios';
import {full_url, PAGE_SIZE} from '../helper/helper.js'
import ProjectPage from './ProjectPage';

export default class ProjectSearch extends React.Component {
  constructor(props){
    super(props)  
    this.state = {
      items: [],
      total_count: 0,
      pageCount: 0,
      error: null
    }
  }
  componentDidUpdate(prevProps, prevState) {
    if ( prevProps.search  !== this.props.search || prevProps.language  !== this.props.language){
      this.fetchProjects()      
    }
  } 

  fetchProjects = () => {
    let search = this.props.search;
    let language = this.props.language;
    let page = 0;        
    let url = full_url(search, language, page)   
    console.log('url:', url)
    if(search === '') return;
    axios.get(url)
    .then((response) => {
      this.setState({
        items: response.data.items,
        total_count: response.data.total_count       
      })
      console.log('response:', response)
    })
    .then((error) => {  
      this.setState({
        error: error    
      })
    });
  };


  render(){
    // ????
    // api only return one page    
    // we are not ablbe to do pagination
    var items = this.state.items;
    var pageSize = PAGE_SIZE;
    var pageCount =  Math.ceil(this.state.total_count/pageSize);
    console.log('props in render', this.props)
    return (
      <ProjectPage
        search = {this.props.search} 
        language = {this.props.language} 
        items = {items} 
        pageCount = {pageCount}
        setPageNumber ={this.props.setPageNumber}
        setSearch ={this.props.setSearch}   
        setLanguage ={this.props.setLanguage}              
      />      
    )
  }
}
ProjectSearch.propTypes = {
  search: PropTypes.string.isRequired,
  language: PropTypes.string.isRequired,    
  setSearch: PropTypes.func.isRequired,
  setLanguage: PropTypes.func.isRequired,   
  // fetchProjects: PropTypes.func.isRequired,
  // setPageNumber: PropTypes.func.isRequired, 
  // items: PropTypes.array.isRequired,
  // total_count: PropTypes.number.isRequired
};

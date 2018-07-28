import React from 'react';
import PropTypes from 'prop-types';
import {Col,  Row } from 'react-bootstrap';
import ReactPaginate from 'react-paginate';
import ProjectTable from './ProjectTable';
import SearchFilter from './SearchFilter';
import '../styles/paging.css';

ProjectPage.propTypes = {
  search:        PropTypes.string.isRequired,
  language:      PropTypes.string.isRequired,  
  items:         PropTypes.array.isRequired,
  pageCount:     PropTypes.number.isRequired,
  setLanguage: PropTypes.func.isRequired,
  setSearch: PropTypes.func.isRequired
}

export default function ProjectPage(props) {
  var items = props.items
  var pageCount = props.pageCount
  var serach_filter = (
      <Row>
        <Col sm={1} />
        <Col sm={4}>
          <h3>github projects listing</h3>        
          <SearchFilter
            search = {props.search}
            language = {props.language}
            setLanguage = {props.setLanguage}
            setSearch = {props.setSearch}      
          />
        </Col>
      </Row>
   )
  if (items === undefined || items.length < 1 )
    return (<div>{serach_filter}</div>)
  else
    return (
      <Row>
        <Col sm={1} />
        <Col sm={10}>
          {serach_filter}
          <ProjectTable items = {items} />
          { pageCount > 1 &&
            <ReactPaginate previousLabel={"previous"}
               nextLabel={"next"}
               breakLabel={<a href="">...</a>}
               breakClassName={"break-me"}
               pageCount={pageCount}
               onPageChange={props.setPageNumber}                       
               containerClassName={"pagination"}
               subContainerClassName={"pages pagination"}
               activeClassName={"active"} />    
          }
        </Col>
        <Col sm={1} />        
      </Row>
    )
}
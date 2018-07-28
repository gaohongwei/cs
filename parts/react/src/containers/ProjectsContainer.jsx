import { connect } from 'react-redux';
import ProjectSearch from '../components/ProjectSearch';

import {
  setSearch,
  setLanguage,  
  // setPageNumber,
  // fetchProjects,
} from '../actions/Projects';

const mapStateToProps = state => (
  {
    // items: state.projects.items,
    // total_count: state.projects.total_count,
    search: state.projects.search,
    language: state.projects.language
  }
);

const mapDispatchToProps = {
  // fetchProjects,
  // setPageNumber,
  setSearch,
  setLanguage,  
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ProjectSearch);
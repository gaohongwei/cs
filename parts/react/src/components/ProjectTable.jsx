import React from 'react'
import PropTypes from 'prop-types';

ProjectTable.propTypes = {
  items: PropTypes.array.isRequired
}
export default function ProjectTable(props) {
  var items = props.items
  return (
    <table>
      <thead>
        <tr>
          <th className="text-xs-left">Name</th>
          <th>Language</th> 
          <th>Owner</th>   
          <th>Forks</th> 
          <th>Watchers</th>     
          <th>Description</th>                                                                                    
        </tr>
      </thead>              
      <tbody>
        { 
          items.map((item)=>
            <tr key={item.id}>
              <td>{item.name}</td>
              <td>{item.language}</td>                 
              <td>{item.owner.login}</td>   
              <td>{item.forks}</td> 
              <td>{item.watchers}</td> 
              <td>{item.description}</td>                                                                                            
            </tr>
          )
        }
      </tbody>
    </table>
  )
}
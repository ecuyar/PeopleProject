import React, { Component } from "react";

class Search extends Component {
  //get the function from props and send parameters to it
  updateFilter = (e) => this.props.filterFunction(e.target.value);

  render() {
    return (
      <div className="input-group inputSearch">
        <input
          type="text"
          className="form-control"
          placeholder="Kullanıcı ara"
          aria-label="Username"
          aria-describedby="basic-addon1"
          onChange={(e) => this.updateFilter(e)}
        />
        <span className="input-group-text" id="inputGroup-sizing-sm">
          <i className="bi bi-search"></i>
        </span>
      </div>
    );
  }
}

export default Search;

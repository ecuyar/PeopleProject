import React, { Component } from "react";
import { NavLink } from "react-router-dom";

class AddButton extends Component {
  render() {
    return (
      <div className="addPersonContainer ms-auto">
        <NavLink className="btn btn-outline-primary" to="/AddPerson">
          <i
            className="bi bi-person-plus-fill"
            style={{ marginRight: "1vh" }}
          ></i>
          Yeni Kişi
        </NavLink>
      </div>
    );
  }
}

export default AddButton;

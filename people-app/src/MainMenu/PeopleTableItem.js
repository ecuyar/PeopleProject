import React, { Component } from "react";
import EditUserButtons from "./EditUserButtons";

class PeopleTableItem extends Component {
  render() {
    return (
      <tr>
        <th scope="row"></th>
        <td>{this.props.number}</td>
        <td>{this.props.firstname}</td>
        <td>{this.props.username}</td>
        <td>{this.props.email}</td>
        <td>{this.props.age}</td>
        <td>
          {EditUserButtons(
            this.props.id,
            this.props.firstname,
            this.props.users
          )}
        </td>
      </tr>
    );
  }
}
export default PeopleTableItem;

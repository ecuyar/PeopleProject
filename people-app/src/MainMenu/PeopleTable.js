import React, { Component } from "react";
import PeopleTableItem from "./PeopleTableItem";
import Search from "./Search";
import AddButton from "./AddButton";

class PeopleTable extends Component {
  constructor(props) {
    super(props);

    this.state = {
      filteredUsers: this.props.users,
    };
  }

  filterUsers = (userName) => {
    if (userName.length === 0) {
      this.setState({ filteredUsers: this.props.users });
    } else {
      //copy filtered users to filteredUsers array
      const filteredArray = this.props.users.filter((user) =>
        user.first_name.toLowerCase().startsWith(userName.toLowerCase())
      );

      this.setState({
        filteredUsers: filteredArray,
      });
    }
  };

  render() {
    return (
      <div>
        <div className="hstack">
          <Search filterFunction={this.filterUsers} />
          <AddButton />
        </div>
        <div className="table-responsive-sm">
          <div className="table-wrapper">
            <table className="table table-hover caption-top peopleTable">
              <caption>
                List of {this.state.filteredUsers.length} user(s)
              </caption>
              <thead>
                <tr>
                  <th></th>
                  <th scope="col">#</th>
                  <th scope="col">Ad</th>
                  <th scope="col">Soyad</th>
                  <th scope="col">Email</th>
                  <th scope="col">Yaş</th>
                  <th scope="col" style={{ width: "18vh" }}>
                    İşlemler
                  </th>
                </tr>
              </thead>
              <tbody>
                {this.state.filteredUsers.map((user, index) => (
                  <PeopleTableItem
                    key={index}
                    id={user.id}
                    number={index + 1}
                    firstname={user.first_name}
                    username={user.last_name}
                    email={user.email}
                    age={
                      new Date().getFullYear() -
                      new Date(user.birthdate).getFullYear()
                    }
                    users={this.state.filteredUsers}
                  />
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}
export default PeopleTable;

import React, { Component } from "react";
import PeopleTable from "./PeopleTable";
import Loading from "../General/Loading";
import alertify from "alertifyjs";
import "../../node_modules/alertifyjs/build/css/alertify.min.css";
import "../../node_modules/alertifyjs/build/css/themes/default.min.css";

class MainMenu extends Component {
  constructor(props) {
    super(props);

    this.state = {
      isUsersLoaded: false,
      isError: false,
      users: [],
    };
  }

  peopleServer = process.env.REACT_APP_PEOPLE_SERVER;

  componentDidMount() {
    setTimeout(() => {
      fetch(`${this.peopleServer}/api/People/All`)
        .then((data) => data.json())
        .then((d) => {
          this.setState({ users: d });
          this.setState({ isUsersLoaded: true });
        })
        .catch((er) => {
          //server offline vs. network error
          if (!er.response) {
            alertify.error("Network error!");
          }
          this.setState({ isUsersLoaded: true });
          this.setState({ isError: true });
        });
    }, 300);
  }

  render() {
    return (
      <div>
        {this.state.isError ? (
          <div>There is a problem, please try again. :(</div>
        ) : this.state.isUsersLoaded ? (
          <PeopleTable users={this.state.users} />
        ) : (
          <Loading />
        )}
      </div>
    );
  }
}
export default MainMenu;

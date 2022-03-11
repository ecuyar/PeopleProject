import React, { Component } from "react";
import { NavLink } from "react-router-dom";

class NavigationBar extends Component {
  constructor(props) {
    super(props);

    this.hide = () => {
      this.setState({ isVisible: false });
    };
  }

  render() {
    return (
      <div>
        {this.props.isVisible ? (
          <div className="navigationButton">
            <NavLink onClick={this.hide} className="nav-link" to="/">
              <i
                className="bi bi-chevron-double-left"
                style={{ paddingRight: "5px" }}
              ></i>
              Anasayfa
            </NavLink>
          </div>
        ) : null}
      </div>
    );
  }
}

export default NavigationBar;

import alertify from "alertifyjs";
import "../../node_modules/alertifyjs/build/css/alertify.min.css";
import "../../node_modules/alertifyjs/build/css/themes/default.min.css";
import axios from "axios";
import React from "react";
import { NavLink } from "react-router-dom";

function EditUserButtons(userId, userName) {
  const peopleServer = process.env.REACT_APP_PEOPLE_SERVER;

  const handleDeletePerson = async (userId, userName) => {
    const result = window.confirm(
      userName + " kullanıcısını silmek istiyor musunuz?"
    );

    if (result) {
      await axios
        .delete(`${peopleServer}/api/People`, {
          params: { id: userId },
        })
        .then((res) => {
          alertify.success(res.data);

          //instead of reloading, users state can be updated
          window.location.reload();
        })
        .catch((res) => {
          //server offline vs. network error
          if (!res.response) {
            alertify.error("Network error!");
          } else {
            alertify.error(res.response.data);
          }
        });
    }
  };

  return (
    <div className="btn-group userActionButton" role="group">
      <NavLink
        className="btn btn-outline-success"
        to={"/EditPerson"}
        state={{ userId: userId }}
      >
        <i className="bi bi-pencil-square" />
      </NavLink>

      <button
        className="btn btn-outline-danger"
        onClick={() => handleDeletePerson(userId, userName)}
      >
        <i className="bi bi-trash3-fill" />
      </button>
    </div>
  );
}

export default EditUserButtons;

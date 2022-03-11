import React, { useState } from "react";
import NavigationBar from "../General/NavigationBar";
import DatePicker, { setDefaultLocale, registerLocale } from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import tr from "date-fns/locale/tr";
import "./AddPerson.css";
import GetJobs from "../Operations/GetJobs";
import GetEducations from "../Operations/GetEducations";
import axios from "axios";
import alertify from "alertifyjs";

function AddPerson() {
  const peopleServer = process.env.REACT_APP_PEOPLE_SERVER;

  //localization for datepicker
  registerLocale("tr", tr);
  setDefaultLocale("tr");

  const [user, setUser] = useState({
    first_name: "",
    last_name: "",
    email: "",
    birthdate: new Date("1.1.1990"),
    job: 1,
    education_status: 1,
  });

  const handleInputChange = (event) => {
    const target = event.target;
    const value = target.value;
    const name = target.name;

    setUser({ ...user, [name]: value });
  };

  //due to the date component its return value should be handled seperately
  const handleDateInputChange = (event) => {
    setUser({ ...user, birthdate: event });
  };

  const checkProcess = (e) => {
    e.preventDefault();

    let form = document.getElementById("addForm");
    form.checkValidity();
    const isOK = form.reportValidity();

    //if form is not valid do not continue
    if (isOK) {
      sendUser(user);
    }
  };

  const sendUser = (userObj) => {
    const jsonPerson = JSON.stringify(userObj);

    axios
      .post(`${peopleServer}/api/People/Add`, jsonPerson, {
        headers: { "Content-Type": "application/json" },
      })
      .then((res) => {
        var mes = alertify.success("Güncelleme başarılı.", 2);
        mes.callback = () => {
          //go to main page
          window.location.pathname = "/";
        };
      })
      .catch((er) => {
        //server offline vs. network error
        if (!er.response) {
          alertify.error("Network error!");
        } else {
          alertify.error(er.response.data);
        }
      });
  };

  return (
    <div>
      <NavigationBar isVisible={true} />
      <form
        id="addForm"
        className="row g-4 col-md-10 needs-validation"
        style={{ display: "inline-flex" }}
      >
        <div className="row col-sm-6 mb-4">
          <label htmlFor="userName" className="col-form-label col-sm-3">
            Ad:
          </label>
          <div className="col-sm-9">
            <input
              type="text"
              className="form-control"
              id="userName"
              name="first_name"
              value={user.first_name}
              onChange={handleInputChange}
              required
            />
          </div>
        </div>

        <div className="row col-sm-6 mb-4">
          <label htmlFor="userLastName" className="col-form-label col-sm-3">
            Soyad:
          </label>
          <div className="col-sm-9">
            <input
              type="text"
              className="form-control"
              id="userLastName"
              name="last_name"
              onChange={handleInputChange}
              value={user.last_name}
              required
            />
          </div>
        </div>

        <div className="row col-sm-6 mb-4">
          <label htmlFor="userEmail" className="col-form-label col-sm-3">
            Email:
          </label>
          <div className="col-sm-9">
            <input
              type="email"
              className="form-control"
              id="userEmail"
              name="email"
              onChange={handleInputChange}
              value={user.email}
              required
            />
          </div>
        </div>

        <div className="row col-sm-6 mb-4">
          <label htmlFor="userBirthdate" className="col-form-label col-sm-4">
            Doğum Tarihi:
          </label>
          <div className="col-sm-8">
            <DatePicker
              id="userBirthdate"
              name="birthday"
              className="form-control"
              onChange={handleDateInputChange}
              startDate={user.birthdate}
              selected={user.birthdate}
              locale={"tr"}
              dateFormat={"dd.MM.yyyy"}
              required
            />
          </div>
        </div>

        <div className="row col-sm-6 mb-4">
          <label htmlFor="userEducation" className="col-form-label col-sm-3">
            Eğitim Durumu:
          </label>
          <div className="col-sm-9">
            <select
              size={3}
              className="form-select"
              id="educationSelect"
              name="education_status"
              value={user.education_status}
              onChange={handleInputChange}
              required
            >
              {GetEducations().map((item) => {
                return (
                  <option key={item.id} value={item.id}>
                    {item.educationName}
                  </option>
                );
              })}
            </select>
          </div>
        </div>

        <div className="row col-sm-6 mb-4">
          <label htmlFor="userJob" className="col-form-label col-sm-3">
            Meslek:
          </label>
          <div className="col-sm-9">
            <select
              size={3}
              className="form-select"
              id="userJob"
              name="job"
              value={user.job}
              onChange={handleInputChange}
              required
            >
              {GetJobs().map((item) => {
                return (
                  <option key={item.id} value={item.id}>
                    {item.jobName}
                  </option>
                );
              })}
            </select>
          </div>
        </div>

        <div className="row" id="submitContainer">
          <button
            type="submit"
            className="btn btn-primary"
            id="submitUser"
            onClick={checkProcess}
          >
            Ekle
          </button>
        </div>
      </form>
    </div>
  );
}
export default AddPerson;

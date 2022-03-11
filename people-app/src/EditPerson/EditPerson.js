import axios from "axios";
import React, { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import NavigationBar from "../General/NavigationBar";
import DatePicker, { setDefaultLocale, registerLocale } from "react-datepicker";
import tr from "date-fns/locale/tr";
import GetJobs from "../Operations/GetJobs";
import GetEducations from "../Operations/GetEducations";
import alertify from "alertifyjs";

function EditPerson() {
  const peopleServer = process.env.REACT_APP_PEOPLE_SERVER;
  //localization for datepicker
  registerLocale("tr", tr);
  setDefaultLocale("tr");

  //get state which sent by navlink
  const location = useLocation();
  const myState = location.state;

  const [user, setUser] = useState({
    id: myState.userId,
    first_name: "",
    last_name: "",
    email: "",
    birthdate: new Date(),
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

    let form = document.getElementById("editForm");
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
      .post(`${peopleServer}/api/People/Update`, jsonPerson, {
        headers: { "Content-Type": "application/json" },
      })
      .then((res) => {
        var mes = alertify.success("Güncelleme başarılı.", 1);
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

  useEffect(() => {
    const getUser = async (id) => {
      await axios
        .get(`${peopleServer}/api/People/` + id)
        .then((res) => {
          setUser({
            ...user,
            first_name: res.data.first_name,
            last_name: res.data.last_name,
            email: res.data.email,
            birthdate: new Date(res.data.birthdate),
            education_status: res.data.education_status,
            job: res.data.job,
          });
        })
        .catch((er) => {
          alertify.error(er);
        });
    };

    getUser(myState.userId);

    //only update when user id is changed
    //prevent infinite loop
  }, [myState.userId]);

  return (
    <div>
      <NavigationBar isVisible={true} />
      <form
        id="editForm"
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
              name="first_name"
              id="userName"
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
              name="last_name"
              id="userLastName"
              value={user.last_name}
              onChange={handleInputChange}
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
              name="email"
              id="userEmail"
              value={user.email}
              onChange={handleInputChange}
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
              className="form-control"
              name="birthday"
              startDate={user.birthdate}
              selected={user.birthdate}
              onChange={handleDateInputChange}
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
              name="job"
              id="userJob"
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
            Kaydet
          </button>
        </div>
      </form>
    </div>
  );
}

export default EditPerson;

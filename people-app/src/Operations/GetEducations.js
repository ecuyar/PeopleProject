import alertify from "alertifyjs";
import axios from "axios";
import { useState, useEffect } from "react";

function GetEducation() {
  const peopleServer = process.env.REACT_APP_PEOPLE_SERVER;

  const [educations, setEducations] = useState([]);

  useEffect(() => {
    axios
      .get(`${peopleServer}/api/Educations`)
      .then((res) => {
        setEducations(res.data);
      })
      .catch((er) => {
        //server offline vs. network error
        if (!er.response) {
          alertify.error("Network error!");
        } else {
          alertify.error(er.response.data);
        }
      });
  }, []);

  return educations;
}
export default GetEducation;

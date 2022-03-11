import alertify from "alertifyjs";
import axios from "axios";
import { useState, useEffect } from "react";

function GetJobs() {
  const peopleServer = process.env.REACT_APP_PEOPLE_SERVER;

  const [jobs, setJobs] = useState([]);

  useEffect(() => {
    axios
      .get(`${peopleServer}/api/Jobs`)
      .then((res) => {
        setJobs(res.data);
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

  return jobs;
}
export default GetJobs;

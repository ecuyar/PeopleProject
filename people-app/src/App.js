import React from "react";
import "./App.css";
import MainMenu from "./MainMenu/MainMenu";
import AddPerson from "./AddPerson/AddPerson";
import "bootstrap-icons/font/bootstrap-icons.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import EditPerson from "./EditPerson/EditPerson";

function App() {
  return (
    <BrowserRouter>
      <div className="App container">
        <div className="App-header" />
        <Routes>
          <Route path="/" exact element={<MainMenu />} />
          <Route path="/AddPerson" exact element={<AddPerson />} />
          <Route path="/EditPerson" exact element={<EditPerson />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;

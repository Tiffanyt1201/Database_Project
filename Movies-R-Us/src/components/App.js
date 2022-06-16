/**
 * Initialization of all the routes and path names of the different pages of the web application 
 */
import React from "react"
import { Container } from "react-bootstrap";
import { AuthProvider } from "../contexts/AuthContext";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"
import PrivateRoute from "./PrivateRoute";

import SignUp from "./login/SignUp"
import Login from "./login/Login"
import ForgotPassword from "./login/ForgotPassword"

import Home from "./dashboard/pages/Home"
import Profile from "./dashboard/pages/Profile"
import ProfileEdit from "./dashboard/pages/ProfileEdit"
import Movies from "./dashboard/pages/Movies"
import TVShows from "./dashboard/pages/TVShows"
import Subscriptions from "./dashboard/pages/Subscriptions"
import Favourites from "./dashboard/pages/Favourites"
import CrewDetails from "./dashboard/pages/CrewDetails"
import ProgramDetails from "./dashboard/pages/ProgramDetails"
import Schedule from "./dashboard/pages/Schedule"
import SearchPage from "./dashboard/pages/SearchPage"

function App() {
  return (
    <Router>
      <AuthProvider>
        <Switch>
          <PrivateRoute exact path="/" component={Home} />
          <PrivateRoute exact path="/profile" component={Profile} />
          <PrivateRoute exact path="/profile-edit" component={ProfileEdit} />
          <PrivateRoute exact path="/movies" component={Movies} />
          <PrivateRoute exact path="/tvshows" component={TVShows} />
          <PrivateRoute exact path="/subscriptions" component={Subscriptions} />
          <PrivateRoute exact path="/favourites" component={Favourites} />
          <PrivateRoute exact path="/crewdetails" component={CrewDetails} />
          <PrivateRoute exact path="/programdetails" component={ProgramDetails} />
          <PrivateRoute exact path="/schedule" component={Schedule} />
          <PrivateRoute exact path="/search-page" component={SearchPage} />

          <Container
            className="d-flex align-items-center justify-content-center"
            style={{ minHeight: "100vh" }}
          >
            <div className="w-100" style={{ maxWidth: '400px' }}>
              <Route path="/signup" component={SignUp} />
              <Route path="/login" component={Login} />
              <Route path="/forgot-password" component={ForgotPassword} />
            </div>
          </Container>
        </Switch>
      </AuthProvider>
    </Router>

  )
}

export default App;

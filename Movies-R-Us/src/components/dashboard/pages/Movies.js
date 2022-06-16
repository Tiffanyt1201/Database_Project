/**
 * Movies page: 
 *  * General user: 
 *      * Shows all movies that are offered by streaming services the user is subscribed to 
 *  * Admin user: 
 *      * Shows all movies in the database 
 */
import React, { useEffect, useState } from 'react'
import styled from 'styled-components'
import Dashboard from '../Dashboard'
import ProgramCard from '../../cards/ProgramCard'

import firebase from "firebase/app";
import "firebase/auth";

export default function Movies() {
    const user = firebase.auth().currentUser;
    var userEmail = user.email

    /**
     * References: 
     *  * How to call an api endpoint and get the data to pass to Program card component 
     *      * How to Call a Flask API in React https://www.youtube.com/watch?v=06pWsB_hoD4&t=0s
     */
    const [admins, setAdmins] = useState([])
    const [userMovies, setUserMovies] = useState([])
    const [allMovies, setAllMovies] = useState([])

    // API call to get list of all admin emails
    useEffect(() => {
        fetch(`/admin`).then(response =>
            response.json()).then(data => {
                setAdmins(data);
            });
    }, []);

    // API call to get all programs that from services the user is subscribed to (will be used when user is not an admin) 
    useEffect(() => {
        fetch(`/programs?Type=Movie&Email=${userEmail}`).then(response =>
            response.json()).then(data => {
                setUserMovies(data);
            });
    }, []);

    // API call to get all programs that exist in the database (will be used when user is an admin)
    useEffect(() => {
        fetch(`/allprograms`).then(response =>
            response.json()).then(data => {
                setAllMovies(data['movies']);
            });
    }, []);

    // Checking if user logged in is aa general user and display the corresponding results (movies filtered by streaming services)
    if (!(admins.some(admin => admin.Email === userEmail))){
        return (
            <>
                <Dashboard />
                <Header>
                    <h1>Movies</h1>
                </Header>
                {/*Passing the object to the ProgramCard component*/}
                <ProgramCard programs={userMovies} />
            </>
        )
    // Displaying all movies in the database 
    } else {
        return (
            <>
                <Dashboard />
                <Header>
                    <h1>Movies</h1>
                </Header>
                {/*Passing the object to the ProgramCard component*/}
                <ProgramCard programs={allMovies} />
            </>
        )
    }
}

/**
 * Movies page UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 10px;
`

/**
 * Movies page: 
 *  * General user: 
 *      * Shows all tv shows that are offered by streaming services the user is subscribed to 
 *  * Admin user: 
 *      * Shows all tv shows in the database 
 */
import React, {useEffect, useState} from 'react'
import styled from 'styled-components'
import Dashboard from '../Dashboard'
import ProgramCard from '../../cards/ProgramCard'

import firebase from "firebase/app";
import "firebase/auth";

export default function TVShows() {
    const user = firebase.auth().currentUser;
    var userEmail = user.email
    
    /**
     * References: 
     *  * How to call an api endpoint and get the data to pass to Program card component 
     *      * How to Call a Flask API in React https://www.youtube.com/watch?v=06pWsB_hoD4&t=0s
     */
    const[admins, setAdmins] = useState([])
    const [tvshows, setTvshows] = useState([]); 
    const [allTvshows, setAllTvshows] = useState([])

    //API call to get list of all admin emails
    useEffect(() => {
        fetch(`/admin`).then(response =>
            response.json()).then(data => {
                setAdmins(data);
            });
    }, []);

    //API call to get all the tv shows that are from services that the user is subscribed to (will be used when user is not an admin) 
    useEffect(()=>{
        fetch(`/programs?Type=TV Show&Email=${userEmail}`).then(response => 
            response.json()).then(data => { 
                setTvshows(data); 
            }); 
    }, []); 

    // API call to get all tv shows that exist in the database (will be used when user is an admin)
    useEffect(() => {
        fetch(`/allprograms`).then(response =>
            response.json()).then(data => {
                setAllTvshows(data['tvshows']);
            });
    }, []);

    // Checking if user logged in is a general user and display the corresponding results (tvshows filtered by streaming services)
    if (!(admins.some(admin => admin.Email === userEmail))){
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1 className="pageHeader">TV Shows</h1>
                </Header>
                {/*Passing the object to the ProgramCard component*/}
                <ProgramCard programs={tvshows}/>
            </>
        )
    // Displaying all tv shwos that exists in the database to an admin user 
    } else {
        return (
            <>
                <Dashboard />
                <Header>
                    <h1>Movies</h1>
                </Header>
                {/*Passing the object to the ProgramCard component*/}
                <ProgramCard programs={allTvshows} />
            </>
        )
    }
}

/**
 * TV Show UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 10px;
`
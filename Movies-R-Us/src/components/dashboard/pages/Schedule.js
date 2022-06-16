/**
 * Schdeule Page: 
 *  * General user: 
 *      * Shows all the programs that are coming to or leaving the streaming services that the user is subscribed to 
 *  * Admin user: 
 *      * Shows all program that are coming to or leaving any streaming service within the database 
 */
import React, {useState, useEffect} from 'react'
import Dashboard from '../Dashboard'
import ProgramCard from '../../cards/ProgramCard'
import styled from 'styled-components'

import firebase from "firebase/app";
import "firebase/auth";

export default function Schedule() {
    const user = firebase.auth().currentUser
    var userEmail = user.email

    const [admins, setAdmins] = useState([])
    const [userComingPrograms, setUserComingPrograms] = useState([])
    const [userLeavingPrograms, setUserLeavingPrograms] = useState([])
    const [allComingPrograms, setAllComingPrograms] = useState([])
    const [allLeavingPrograms, setAllLeavingPrograms] = useState([])

    // API call to get the list of all admin emails 
    useEffect(() => {
        fetch(`/admin`).then(response =>
            response.json()).then(data => {
                setAdmins(data);
            });
    }, []);

    // API call to get programs that are coming are leaving soon that are offered by services the user logged in is subscribed (will be used when user is not an admin)
    useEffect(() => {
        fetch(`/userprogramschedule?Email=${userEmail}`).then(response =>
            response.json()).then(data => {
                setUserComingPrograms(data['comingsoon']);
                setUserLeavingPrograms(data['leavingsoon']);
            });
    }, []);

    // API call to get all programs that are coming are leaving soon that are offered by any service (will be used when user is an admin)
    useEffect(() => {
        fetch(`/allprogramschedule`).then(response =>
            response.json()).then(data => {
                setAllComingPrograms(data['comingsoon']);
                setAllLeavingPrograms(data['leavingsoon']);
            });
    }, []);

    // Checking if user logged in is a general user and display the corresponding results (filtered programs by subscribed services)
    if (!(admins.some(admin => admin.Email === userEmail))){
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1 >Coming Soon</h1>
                </Header>
                <Scroll><ProgramCard programs={userComingPrograms}/></Scroll>
                <Header2>
                    <h1>Leaving Soon</h1>
                </Header2>
                <Scroll><ProgramCard programs={userLeavingPrograms}/></Scroll>
            </>
        )
    // Displaying all programs that are coming to and leaving any service to the admin user 
    } else {
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1 >Coming Soon</h1>
                </Header>
                <Scroll><ProgramCard programs={allComingPrograms}/></Scroll>
                <Header2>
                    <h1>Leaving Soon</h1>
                </Header2>
                <Scroll><ProgramCard programs={allLeavingPrograms}/></Scroll>
            </>
        )
    }
}

/**
 * Schedule UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 70px;
`
const Header2 = styled.div`
    margin-left: 240px; 
    margin-top: 50px;
`

/*
 * References: 
 * Making Scrollable sections within a page: 
 *      How To Make A Div Vertically Scrollable Using CSS https://www.youtube.com/watch?v=uB1KzjV0IhM 
 */
const Scroll = styled.div`
    height: 400px; 
    overflow: hidden; 
    overflow-y: auto; 
`

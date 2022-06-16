/**
 * Home page: 
 *  * General user: 
 *      * Shows all movies and tv shows that exist in the database 
 *  * Admin user: 
 *      * Shows the list of all users and the number of users that are using the system 
 */
import React, {useState, useEffect} from 'react'
import styled from 'styled-components'
import Dashboard from '../Dashboard'
import ProgramCard from '../../cards/ProgramCard'
import UserCard from '../../cards/UserCard'

import firebase from "firebase/app";
import "firebase/auth";

export default function Home() {
    const user = firebase.auth().currentUser;
    var userEmail = user.email

    const [admins, setAdmins] = useState([]);
    const [users, setUsers] = useState([]);
    const [movies, setMovies] = useState([]);
    const [tvshows, setTvshows] = useState([]);

    // API call to get the list of all admin emails 
    useEffect(() => {
        fetch(`/admin`).then(response =>
            response.json()).then(data => {
                setAdmins(data);
            });
    }, []);

    // API call to get all programs that exist in the database 
    useEffect(() => {
        fetch(`/allprograms`).then(response =>
            response.json()).then(data => {
                setMovies(data['movies']);
                setTvshows(data['tvshows']);
            });
    }, []);

    // API call to get all users that exist in the database (will be displayed in admin home page)
    useEffect(() => {
        fetch(`/allusers?Email=${userEmail}`).then(response =>
            response.json()).then(data => {
                setUsers(data['users']);
            });
    }, []);

    // Check if user logged in is a general user and display the corresponding results (all movies and tv shows)
    if (!(admins.some(admin => admin.Email === userEmail))){
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1>Movies</h1>
                </Header>
                <Scroll><ProgramCard programs={movies}/></Scroll>
                <Header2>
                    <h1>TV Shows</h1>
                </Header2>
                <Scroll><ProgramCard programs={tvshows}/></Scroll>
            </>
        )
    // Displaying list of all users and the number of users for the admin home page 
    } else {
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1>User Count: </h1>
                    <h2>{users.length}</h2>
                </Header>
                <Header>
                    <h1>List of Users: </h1>
                </Header>
                <Container><UserCard users={users} /></Container>

            </>
        )
    }
}

/**
 * Home page UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 70px;
`
const Header2 = styled.div`
    margin-left: 240px; 
    margin-top: 50px;
    margin-bottom: 0px; 
`

const Container = styled.div`
    margin-left: 0px; 
    margin-top: 0px;
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

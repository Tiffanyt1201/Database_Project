/**
 * Profile Page: 
 *  * Shows all information of the user that is logged in 
 */
import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'
import Dashboard from '../Dashboard'

import firebase from "firebase/app";
import "firebase/auth";

export default function Profile() {
    var user = firebase.auth().currentUser;
    var userEmail = user.email;

    const [userDetails, setUserDetails] = useState([]);

    // API call to get all inforation of a specific user 
    useEffect(() => {
        fetch(`/profile?Email=${userEmail}`).then(response =>
            response.json()).then(data => {
                console.log(data)
                setUserDetails([data['userInfo']])

            });
    }, []);

    // Profile Page UI 
    return (
        <>
            <Dashboard />
            {userDetails.map(details => (
                <div>
                    <Header>
                        <h1>My Profile</h1>
                    </Header>

                    <div>
                        <Image>
                            <img style={{ width: "160px", height: "160px" }} src="https://upload.wikimedia.org/wikipedia/en/thumb/f/fb/UofCCoat.svg/1200px-UofCCoat.svg.png" alt="" />
                        </Image>
                        <Email><h2>{userEmail}</h2></Email>
                        {/*<ChangeBtn><Button>Change Password</Button></ChangeBtn>*/}
                        <Box>
                            <Title>
                                <h3 style={{marginTop: "30px"}}>Pesonal Information: </h3>
                            </Title>
                            <Text>
                                <h5 style={{marginTop: "0px"}}>Name: {details.Name}</h5>
                                <h5 style={{marginTop: "0px"}}>Username: {details.Username}</h5>
                                <h5 style={{marginTop: "0px"}}>Age: {details.Age}</h5>
                                <h5 style={{marginTop: "0px"}}>Gender: {details.Gender}</h5>
                                <h5 style={{marginTop: "0px"}}>Languages: {details.Language}</h5>
                            </Text>
                            <EditLink><Link to="/profile-edit">Edit Information</Link></EditLink>
                        </Box>
                    </div>
                </div>
            ))}
        </>
    )
}

/**
 * Profile page UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 10px;
`
const Image = styled.div` 
    border-radius: 80px; 
    margin-left: 700px; 
    margin-top: 50px;
`

const Email = styled.div`
    margin-left: 680px; 
    margin-top: 10px;
`
const ChangeBtn = styled.div`
    margin-left: 1000px; 
    margin-top: 20px;
`

/**
 * References: 
 *  * Build a Recipe App With React | React Tutorial For Beginners https://www.youtube.com/watch?v=U9T6YkEDkMo&list=PLDyQo7g0_nsVHmyZZpVJyFn5ojlboVEhE&index=2 
 * */
const Box = styled.div`
    margin-top: 50px; 
    border-radius: 10px;
    box-shadow: 0px 12px 18px -6px rgba(0, 0, 0, 0.3);  
    margin-left: 400px; 
    background: white;
    height: 210px; 
    width: 800px; 
`

/**
 * References: 
 *  * Build a Recipe App With React | React Tutorial For Beginners https://www.youtube.com/watch?v=U9T6YkEDkMo&list=PLDyQo7g0_nsVHmyZZpVJyFn5ojlboVEhE&index=2 
 * */
const Title = styled.div`
    margin-top: 30px;
    margin-left: 20px;
`
const Text = styled.div`
    margin-top: 10px;
    margin-left: 60px;
`
const EditLink = styled(Link)`
    margin-left: 650px; 
`
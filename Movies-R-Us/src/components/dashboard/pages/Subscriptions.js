/**
 * Subscription page: 
 *  * General user: 
 *      * Shows all the streaming services that the user is subscribed to 
 *  * Admin user: 
 *      * Shows the list of all streaming services that exist in the database 
 */
import React, {useState, useEffect} from 'react'
import styled from 'styled-components'
import {Button} from 'semantic-ui-react'
import Dashboard from '../Dashboard'
import SubCard from '../../cards/SubCard'
import AddServiceForm from '../../forms/AddServiceForm'

import firebase from "firebase/app";
import "firebase/auth";

export default function Subscriptions() {
    const user = firebase.auth().currentUser
    var userEmail = user.email

    const [admins, setAdmins] = useState([])
    const [addServiceBtn, setAddServiceBtn] = useState(false); 
    const [userSubs, setUserSubs] = useState([]); 
    const [allServices, setAllServices] = useState([])

    //API call to get the list of all admin emails
    useEffect(() => {
        fetch(`/admin`).then(response =>
            response.json()).then(data => {
                setAdmins(data);
            });
    }, []);

    // API call to get list of all available streaming services 
    useEffect(()=>{
        fetch('/services').then(response => 
            response.json()).then(data => { 
                setAllServices(data)
            }); 
    }, []); 

    // API call to get the list of streaming servies that the user is subscribed to 
    useEffect(()=>{
        fetch(`/usersubscriptions?Email=${userEmail}`).then(response => 
            response.json()).then(data => { 
                setUserSubs(data); 
            }); 
    }, []); 

    // Checking if user logged in is an a general user and display the corresponding info (only the services that they are subscribed to)
    if (!(admins.some(admin => admin.Email === userEmail))){
        /**References: How to update UI when adding and removing services:  
         *  * How to Call a Flask API in React: https://www.youtube.com/watch?v=06pWsB_hoD4
        */
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1>My Subscriptions</h1>
                </Header>
                <AddBtn><Button color='blue' onClick={() => setAddServiceBtn(true)}>Add Service</Button></AddBtn>
                <SubCard services={userSubs} userEmail={userEmail} adminStatus={false} onRemovedService={serviceRemoved => setUserSubs(userSubs.filter(service => service['Service_name'] != serviceRemoved))}/>
                <AddServiceForm trigger={addServiceBtn} setTrigger={setAddServiceBtn} userEmail={userEmail} userServices={userSubs} allServices={allServices} onAddedService={newService => setUserSubs(currentServices => [...currentServices, newService])}/>
            </>
        )
    // Displaing list of all services (admin user is NOT given the option to remove a streaming service)
    } else {
        return (
            <>
                <Dashboard/>
                <Header>
                    <h1>All Services</h1>
                </Header>
                <SubCard services={allServices} userEmail={userEmail} adminStatus={true}/>
            </>
        )
    }
}

/**
 * Subscription UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 70px;
`
const AddBtn = styled.div `
    margin-left: 1060px; 
    margin-top: 10px;
`

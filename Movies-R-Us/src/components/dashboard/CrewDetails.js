/**
 * Crew details page: 
 *  * Shows all information of a specific crew member. Includes crew member information and programs the crew member is involved in
 */
import React, {useState, useEffect} from 'react'
import {Button} from 'semantic-ui-react'
import styled from 'styled-components'
import Dashboard from '../Dashboard'
import ProgramCard from '../../cards/ProgramCard'

import firebase from "firebase/app";
import "firebase/auth";

export default function CrewDetails(props) {
    const user = firebase.auth().currentUser
    var userEmail = user.email
    var Cid = props.location.state['Cid']
    var favCrew = [] 
    var favStatus

    const [crewDetails, setCrewDetails] = useState([])
    const [crewPrograms, setCrewPrograms] = useState([])
    const [crewRoles, setCrewRoles] = useState([])
    const [userFavCrew, setUserFavCrew] = useState([]); 

    //API call to get all details of a specific crew member. Crew member is identified by a unique Cid. 
    useEffect(() => {
        fetch(`/crewdetails?Cid=${Cid}`).then(response =>
            response.json()).then(data => {
                setCrewDetails([data['crewinfo']])
                setCrewPrograms(data['crewprograms'])
                setCrewRoles(data['crewroles'])
                console.log(props.location.state['Cid'])
            });
    }, []);

    //API call to get a list of call the crew members favourtied by the user logged in. 
    useEffect(()=>{
        fetch(`/userfavs?Email=${userEmail}`).then(response => 
            response.json()).then(data => { 
                setUserFavCrew(data['favouritecrew'])
            }); 
    }, []); 

    //Getting the Cid of all the user favourited crew members 
    for (var i=0; i<userFavCrew.length; i++){
            favCrew.push(userFavCrew[i]['Cid'])
    }
    
    //Checking if the crew member has already been added to the user's favourite 
    if (favCrew.includes(Cid)){
        favStatus = true; 
    }
    else {
        favStatus = false; 
    } 

    // Handling the click event of the favourite button 
    async function addOrRemoveFavourite(){
        // Request to add the crew member to user favourites 
        if (favStatus == false){ 
            const request = {
                method: 'POST', 
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ Email: userEmail,  Uid: '', Cid: Cid})
            }
            console.log(request)
            const response = await fetch('/userfavs', request); 
            if (response.ok){
                console.log('Added to favourites added')
                alert('Crew has been successfully added to your favourites')      
            } else{
                console.log('Not successful')
            }
            favStatus = true
        }
        // Request to remove crew member from user's favourites 
        else{
            const request = {
                method: 'DELETE', 
                headers: { 'Content-Type': 'application/json' },
            }
            const response = await fetch(`/userfavs?Email=${userEmail}&Cid=${Cid}`, request); 
            if (response.ok){
                console.log('Removed from favourtes')
                alert('Crew has been successfully removed from your favourites')
            } else{
                console.log('Remove not successful')
            }
            favStatus = false; 
        } 
    }

    // Crew details page UI
    return (
        <>
            <Dashboard />
            {crewDetails.map(details => (
                <div>
                    <Top>
                        <Image><img style={{width: "240px", height: "330px"}} src={details.Image} alt="" /></Image>
                        <div style={{ marginLeft: "50px" }}>
                            <Title><h1>{details.Name}</h1></Title>
                            <div>
                                <Text><h3>Gender: {details.Name}</h3></Text>
                                <Text><h3>Hometown: {details.Hometown}</h3></Text>
                                <Text1><h3>Roles:</h3></Text1>
                                {crewRoles.map(roles => (
                                    <h4 style={{ marginLeft: "50px", marginTop: "0px", marginBottom: "2px" }}>{roles.Crew_role}</h4>
                                ))}
                            </div>
                        </div>
                    </Top>
                    <AddFavBtn><Button color='blue' style={{height: "40px"}} onClick={addOrRemoveFavourite}>Favourite</Button></AddFavBtn>
                    <Header><h2>Filmography</h2></Header>
                    <Scroll><ProgramCard programs={crewPrograms} /></Scroll>
                </div>
            ))}
        </>
    )
}

/**
 * Crew details UI styling 
 */
const Top = styled.div`
    display: flex; 
    margin-top: 80px;
    margin-left: 180px; 
`
const Title = styled.div`
    margin-right: 0px; 
    margin-bottom: 20px; 
`
const Text = styled.div`
    margin-left: 30px; 
    margin-top: 0px; 
    margin-bottom: 20px; 
`
const Text1 = styled.div`
    margin-left: 30px; 
    margin-top: 0px; 
    margin-bottom: 5px; 
`

const Header = styled.div`
    margin-left: 240px; 
    margin-top: 50px;
`
const Image = styled.div` 
    margin-left: 90px; 
    margin-right: 0px;   
`
const AddFavBtn = styled.div`
    margin-left: 340px; 
    margin-top: 20px;
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

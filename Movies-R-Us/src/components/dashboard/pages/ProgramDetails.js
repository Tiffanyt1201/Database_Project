/**
 * Program Details Page: 
 *  * Shows all the details of a specific program (this includes the program information, crew members, and reviews)
 */
import React, {useState, useEffect} from 'react'
import {Button} from 'semantic-ui-react'
import styled from 'styled-components'
import Dashboard from '../Dashboard'
import CrewCard from '../../cards/CrewCard'
import ReviewCard from '../../cards/ReviewCard'
import AddReviewForm from '../../forms/AddReviewForm'

import firebase from "firebase/app";
import "firebase/auth";

export default function ProgramDetails(props) {
    const user = firebase.auth().currentUser
    var userEmail = user.email 
    /**
     * References: 
     *  * Getting the Uid that was passed to this page during redirecting: 
     *      * https://reactrouter.com/web/api/location*/ 
    var Uid = props.location.state['Uid']
    var favStatus; 
    var favPrograms = []

    const [addReviewBtn, setAddReviewBtn] = useState(false); 
    const [programDetails, setProgramDetails] = useState([]);
    const [programCrew, setProgramCrew] = useState([]); 
    const [programReviews, setProgramReviews] = useState([]); 
    const [userFavPrograms, setUserFavPrograms] = useState([]); 

    // API call to get all details of a program (details include program info, program crew members and program reviews)
    useEffect(()=>{
        fetch(`/programdetails?Uid=${Uid}`).then(response => 
            response.json()).then(data => { 
                setProgramDetails([data['programinfo']]); 
                setProgramCrew(data['programcrew'])
                setProgramReviews(data['programreviews'])
            }); 
    }, []); 

    // API call to get all programs that the user has favourited (used to set the status of the favourite button)
    useEffect(()=>{
        fetch(`/userfavs?Email=${userEmail}`).then(response => 
            response.json()).then(data => { 
                setUserFavPrograms([...data['favouriteshows'], ...data['favouritemovies']])
            }); 
    }, []); 

    //Getting the Uid of all the user favourited programs 
    for (var i=0; i<userFavPrograms.length; i++){
        favPrograms.push(userFavPrograms[i]['Uid'])
    }

    //Checking if the program has already been added to the user's favourite 
    if (favPrograms.includes(Uid)){
        favStatus = true; 
    }
    else {
        favStatus = false; 
    } 

    // Handling the click event of the Favourite button
    async function addOrRemoveFavourite(){
        //Request to add program to user reviews  
        if (favStatus == false){ 
            const request = {
                method: 'POST', 
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ Email: userEmail,  Uid: Uid, Cid: ''})
            }
            console.log(request)
            const response = await fetch('/userfavs', request); 
            if (response.ok){
                console.log('Added to favourites added')
                alert('Program has been successfully added to your favourites')      
            } else{
                console.log('Not successful')
            }
            favStatus = true
        }
        // Request to remove program from user favourites 
        else{
            const request = {
                method: 'DELETE', 
                headers: { 'Content-Type': 'application/json' },
            }
            const response = await fetch(`/userfavs?Email=${userEmail}&Uid=${Uid}`, request); 
            if (response.ok){
                console.log('Removed from favourtes')
                alert('Program has been successfully removed from your favourites')
                console.log(response)
            } else{
                console.log('Remove not successful')
            }
            favStatus = false; 
        } 
    }

    // Program details UI 
    return (
        <>
            <Dashboard/>
            <h1></h1>
            {programDetails.map(details => {
                // Check if the program is a movie and display the corresponding details 
                if (details.Type == 'Movie'){
                    return (
                        <div>
                        <Top>
                            <Image><img style={{width: "250px", height: "350px"}} src={details.Image} alt=""/></Image>
                            <div style={{marginLeft: "50px"}}>
                                <Title><h1>{details.Name}</h1></Title>
                                <div>
                                    <Text><h3>Type: {details.Type}</h3></Text>
                                    <Text><h3>Age-Rating: {details.Age_rating}</h3></Text>
                                    <Text><h3>Year: {details.Year}</h3></Text>
                                    <Text><h3>Genre: {details.Genre}</h3></Text>
                                    <Text><h3>Language: English</h3></Text>
                                    <Text><h3>Duration: {details.Run_time}</h3></Text>
                                    <Text><h3>Arrival Date: {details.Arrival_month} {details.Arrival_day}, {details.Arrival_year}</h3></Text>
                                    <Text><h3>Departure Date: {details.Departure_month} {details.Departure_day}, {details.Departure_year}</h3></Text>
                                </div>
                            </div>
                        </Top>
                        <div style={{marginTop: "0px", float: "left"}}>
                            <RatingText><h3>Rating: {details.User_rating}/10</h3></RatingText>
                            {/*{toggle ? "Remove From Favourites" : "Add To Favourites"} */}
                            <AddFavBtn><Button color='blue' onClick={addOrRemoveFavourite}>Favourite</Button></AddFavBtn>
                        </div>
                        <div style={{marginLeft: "200px", marginTop: "-10px"}}>
                            <h3 style={{marginLeft: "380px"}}>Streaming Service:</h3>
                            <Box style={{marginTop: "0px"}}>
                                <Top>
                                    <img style={{width: "60px", height: "60px", borderRadius: "10px", marginLeft: "-160px", marginTop: "-50px"}} src={details.Logo} alt=""/>   
                                    <div>
                                        <Text style={{marginLeft: "20px", marginTop: "-35px"}}><h3>{details.Service_name}</h3></Text>
                                    </div>
                                </Top>
                            </Box>
                        </div>
                        <Header><h2>Synopsis</h2></Header>
                        <SynopText>
                            <h4>{details.Description}</h4>
                        </SynopText>
                        <Header><h2>Crew</h2></Header>
                        <Scroll><CrewCard programCrew={programCrew}/></Scroll>
                        <Header><h2>Reviews <AddRevBtn><Button color='blue' onClick={() => setAddReviewBtn(true)}>Add Review</Button></AddRevBtn></h2></Header>  
                        <ReviewCard programReviews={programReviews}/>
                        {/*References opening a review popup form: Build a POPUP component in React JS ~ A Beginner Tutorial with React https://www.youtube.com/watch?v=i8fAO_zyFAM */}
                        <AddReviewForm trigger={addReviewBtn} setTrigger={setAddReviewBtn} Uid={Uid} userEmail={userEmail} onAddedReview={newReview => setProgramReviews(currentReviews => [...currentReviews, newReview])}/>
                    </div>
                )}
                // Checking if the program is a tv show and displaying the corresponding results 
                else if(details.Type == 'TV Show'){
                    return(
                        <div>
                <Top>
                    <Image><img style={{width: "250px", height: "350px"}} src={details.Image} alt=""/></Image>
                    <div style={{marginLeft: "50px"}}>
                        <Title><h1>{details.Name}</h1></Title>
                        <div>
                            <Text><h3>Type: {details.Type}</h3></Text>
                            <Text><h3>Age-Rating: {details.Age_rating}</h3></Text>
                            <Text><h3>Year: {details.Year}</h3></Text>
                            <Text><h3>Genre: {details.Genre}</h3></Text>
                            <Text><h3>Language: English</h3></Text>
                            <Text><h3>Number of Seasons: {details.No_of_seasons}</h3></Text>
                            <Text><h3>Arrival Date: {details.Arrival_month} {details.Arrival_day}, {details.Arrival_year}</h3></Text>
                            <Text><h3>Departure Date: {details.Departure_month} {details.Departure_day}, {details.Departure_year}</h3></Text>
                        </div>
                    </div>
                </Top>
                <div style={{marginTop: "0px", float: "left"}}>
                    <RatingText><h3>Rating: {details.User_rating}/10</h3></RatingText>
                    <AddFavBtn><Button color='blue' onClick={addOrRemoveFavourite}>Favourite</Button></AddFavBtn>
                </div>
                <div style={{marginLeft: "200px", marginTop: "-10px"}}>
                    <h3 style={{marginLeft: "380px"}}>Streaming Service:</h3>
                    <Box style={{marginTop: "0px"}}>
                        <Top>
                            <img style={{width: "60px", height: "60px", borderRadius: "10px", marginLeft: "-160px", marginTop: "-50px"}} src={details.Logo} alt=""/>   
                            <div>
                                <Text style={{marginLeft: "20px", marginTop: "-35px"}}><h3>{details.Service_name}</h3></Text>
                            </div>
                        </Top>
                    </Box>
                </div>
                <Header><h2>Synopsis</h2></Header>
                <SynopText>
                    <h4>{details.Description}</h4>
                </SynopText>
                <Header><h2>Crew</h2></Header>
                <Scroll><CrewCard programCrew={programCrew}/></Scroll>
                <Header><h2>Reviews <AddRevBtn><Button color='blue' onClick={() => setAddReviewBtn(true)}>Add Review</Button></AddRevBtn></h2></Header>
                <ReviewCard programReviews={programReviews}/>
                <AddReviewForm trigger={addReviewBtn} setTrigger={setAddReviewBtn} Uid={Uid} userEmail={userEmail} onAddedReview={newReview => setProgramReviews(currentReviews => [...currentReviews, newReview])}/>
            </div>
            )}})}
        </>
    )
}

// Program details UI styling 
const Box = styled.div`
    margin-top: 30px; 
    margin-bottom: 20px; 
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-item: center; 
    border-radius: 10px;
    box-shadow: 0px 12px 18px -6px rgba(0, 0, 0, 0.3);  
    margin-left: 400px; 
    background: #DADADA;
    height: 100px; 
    width: 300px; 
`

const Top = styled.div`
    display: flex; 
    margin-top: 50px;
    margin-left: 180px; 
`

const Title = styled.div `
    margin-right: 0px; 
    margin-bottom: 20px; 
`

const Header = styled.div`
    margin-left: 240px; 
    margin-top: 30px;
`
const Image = styled.div`
    margin-left: 90px; 
    margin-right: 0px; 
`
const AddFavBtn = styled.div `
    margin-left: 270px; 
    margin-top: 20px;
`

const AddRevBtn = styled.div `
    margin-left: 750px; 
`

/*
 * References: 
 * Making Scrollable sections within a page: 
 *      How To Make A Div Vertically Scrollable Using CSS https://www.youtube.com/watch?v=uB1KzjV0IhM 
 */
const Scroll = styled.div`
    height: 300px; 
    padding-bottom: 50px; 
    overflow: hidden; 
    overflow-y: auto; 
`

const RatingText = styled.div `
    margin-left: 270px; 
    margin-top: 20px;
`

const Text = styled.div `
    margin-left: 30px; 
    margin-top: 0px; 
    margin-bottom: 10px; 
`

const SynopText = styled.div `
    margin-left: 270px; 
    margin-top: 10px; 
    width: 1010px; 
    display: flex; 
    justify-content: space-around; 
`
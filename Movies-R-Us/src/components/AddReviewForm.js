/**
 * Add Review Form popup 
 *  * Popup componenet that is displayed when the user clicks on the "Add Review" button on the program details page
 */
import React, {useState} from 'react'
import styled from 'styled-components'
import {Form, Input, Rating, Button} from 'semantic-ui-react'

export default function AddReviewForm(props){
    const [userRating, setUserRating] = useState(0)
    const [review, setReview] = useState('')
    var obj; 
    var Uid = props.Uid
    var Email = props.userEmail 

    // Handling the click event of the "x" button on the popup (will close the popup and reset the rating and decription values)
    function closeReview(){
        props.setTrigger(false)
        setUserRating(0)
        setReview('') 
    }

    /*
     * Handling the click event of the "Submit" button on the popup (popup will close and newly added review will be dislayed on the screen)
     * References: 
     *  * Creating request object and getting reponse from API after adding a user review to a certain movie: 
     *      * Flask Movie API Example: https://www.youtube.com/watch?v=Urx8Kj00zsI
     */
    async function submitReview(){
        // Checking to make sure description field of an review is NOT empty 
        if (review == ''){
            console.log('error! Description cannot be empty')
            alert('Description field cannot be empty!')
        } 
        // Creating a request object with info and the review inputs entered by the user 
        else{
            const request = {
                method: 'POST', 
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ Uid: Uid, Email: Email, Rating: userRating, Description: review})
            }
            /**
             * API call to add a new review of a specific program 
             * References: 
             *  * Handling response status using fetch in react JS: https://jasonwatmore.com/post/2020/02/01/react-fetch-http-post-request-examples*/ 
            await fetch('/userreview', request).then(response => {
                if (response.ok){
                    return response.json()
                }
            }).then(data => { 
                console.log(data)
                obj = data
                }); 
            props.onAddedReview({Author: obj['Username'], Date: obj['Date'], Description: review, Rating: userRating})
            props.setTrigger(false)
            setUserRating(0)
            setReview('')   
        }    
    }
    /*
     * Add Review popup UI 
     * References: 
        * Creating a add review popup form where users can add a review: 
            * Build a POPUP component in React JS ~ A Beginner Tutorial with React https://www.youtube.com/watch?v=i8fAO_zyFAM */
    return (props.trigger)?(
        <Popup>
            <ReviewForm>
                <Form>
                    <Top>
                        <h2 style={{width: "300px"}}>Add a review</h2>
                        <CloseBtn><Button variant="default" onClick={closeReview} icon='close'/></CloseBtn>
                    </Top>
                    <Form.Field>
                        <Rating size="huge" icon='star' maxRating={5} value={userRating} onRate={(_, data) => {setUserRating(data.rating)}}/> 
                    </Form.Field>
                    <Form.Field>
                        <Input placeholder="Write your review here" value={review} onChange={event => setReview(event.target.value)}/>
                    </Form.Field>
                    <SubmitBtn><Button color='blue' variant="default" onClick={submitReview}>Submit</Button></SubmitBtn>
                </Form>
                {props.children}    
            </ReviewForm>             
        </Popup>
    ) : ""; 
}; 

/**
 * Add review popup UI styling 
 */
const Popup = styled.div `
    display: flex; 
    justify-content: center; 
    align-items: center; 
    position: fixed; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100vh;  
    background-color: rgba(0, 0, 0, 0.2);
`

const ReviewForm = styled.div `
    position: relative; 
    width: 700px; 
    padding: 10px;  
    background-color: white; 
    border-radius: 10px;
`

const Top = styled.div`
    display: flex;  
    margin-bottom: 0px; 
`

const CloseBtn = styled.div`
    margin-top: 0px; 
    margin-bottom: 10px;  
    margin-left: 400px;   
`
const SubmitBtn = styled.div`
    margin-top = 10px;  
    margin-left: 590px;
`
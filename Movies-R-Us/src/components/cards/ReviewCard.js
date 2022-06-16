/**
 * Review Card: 
 *  * Shows each review of a program as a box component 
 */
import React from 'react'
import styled from 'styled-components'
import {Rating} from 'semantic-ui-react'

export default function ReviewCards({programReviews}){
    /**
     * Rendering each creview in the list of reviews each as an individual box component
     * References: 
     *  * To populate each card with information from card content object: 
     *      * Dynamically Create Cards In ReactJS Using React-Bootstrap https://www.youtube.com/watch?v=IhWFs0diAPE
     */
    const renderCard = (card, index) => {
        return (
            <div>
                <Box>
                    <Top>
                        <img style={{width: "40px", height: "40px", marginLeft: "15px"}} src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_yrd8qyMAeTKfxPH00Az2BqE561qnoB5Ulw&usqp=CAU' alt=""/>   
                        <div>
                            <h3 style={{marginTop: "0px", marginLeft: "10px", marginBottom: "0px"}}>{card.Author}</h3>
                            <div>
                                <Rating style={{marginTop: "5px", marginLeft: "20px",marginBottom: "0px"}} rating={card.Rating} maxRating={5}></Rating>
                            </div>
                        </div>
                        <div>
                            <h5 style={{marginTop: "0px", marginLeft: "535px", marginBottom: "0px"}}>{card.Date}</h5>
                        </div>
                    </Top>
                    <Text>
                        <h6>{card.Description}</h6>
                    </Text>
                </Box>
            </div>
        ); 
    }; 
    return <div>{programReviews.map(renderCard)}</div>; 
}; 

/**
 * Review Box component styling 
 */
const Top = styled.div`
    display: flex;  
    margin-bottom: 0px; 
`

/*
 * References: 
 *  To create box for every subscription service: 
 *      Build a Recipe App With React | React Tutorial For Beginners https://www.youtube.com/watch?v=U9T6YkEDkMo&list=PLDyQo7g0_nsVHmyZZpVJyFn5ojlboVEhE&index=2 */
const Box = styled.div`
    margin-top: 30px; 
    margin-bottom: 20px; 
    margin-left: 300px; 
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-item: center; 
    border-radius: 10px;
    box-shadow: 0px 12px 18px -6px rgba(0, 0, 0, 0.3);  
    background: white;
    min-height: 100px; 
    width: 800px; 
`

const Text = styled.div`
    margin-left: 70px; 
`
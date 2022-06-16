/**
 * User Card: 
 *  Shows each user that is using the system as a box component (for admin view)
 */
import React from 'react'
import styled from 'styled-components'

export default function UserCard({users}){
    /**
     * Rendering each user in the list of users each as an individual box component
     * References: 
     * To populate each card with information from card content object: 
     *      Dynamically Create Cards In ReactJS Using React-Bootstrap https://www.youtube.com/watch?v=IhWFs0diAPE
     */
    const renderCard = (card, index) => {
        return (
                <div>
                    <Box>
                        <Top>
                            <img style={{width: "60px", height: "60px", borderRadius: "10px", marginLeft: "20px", marginTop: "5px"}} src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_yrd8qyMAeTKfxPH00Az2BqE561qnoB5Ulw&usqp=CAU' alt=""/>   
                            <div>
                                <h3 style={{marginTop: "15px", marginLeft: "15px", marginBottom: "0px"}}>{card.Username}</h3>
                                <Text>
                                    <h6>{card.Name}</h6>
                                    <h6>{card.Email}</h6>
                                </Text>
                            </div>
                        </Top>
                    </Box>
                </div>
            ); 
        }; 
    return <div>{users.map(renderCard)}</div>; 
}; 

/*
 * User box component UI styling 
 * References: 
 *  To create box for every subscription service: 
 *      Build a Recipe App With React | React Tutorial For Beginners https://www.youtube.com/watch?v=U9T6YkEDkMo&list=PLDyQo7g0_nsVHmyZZpVJyFn5ojlboVEhE&index=2 */
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
    height: 140px; 
    width: 800px; 
`
const Top = styled.div`
    display: flex;  
    margin-bottom: 0px; 
`
const Text = styled.div`
    margin-left: 30px; 
    margin-top: 15px; 
`
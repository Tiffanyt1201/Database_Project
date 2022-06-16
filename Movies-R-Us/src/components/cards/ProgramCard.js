/**
 * Program Card: 
 *  * Shows each program as an indivudal card component 
 */
import React from 'react'
import {useHistory} from 'react-router-dom'
import './Card.css'

export default function ProgramCard({programs}){
    let history = useHistory(); 
    /**
     * Rendering each program in the list of programs each as an individual card component
     * References: 
     *  * To create individual cards: https://react-bootstrap.github.io/components/cards/ 
     *  * To populate each card with information from card content object: 
     *      * Dynamically Create Cards In ReactJS Using React-Bootstrap https://www.youtube.com/watch?v=IhWFs0diAPE
     * * To pass Uid of card to the more details page: How to pass props with react-router using onClick methods
     *   https://stackoverflow.com/questions/54083066/how-to-pass-props-with-react-router-using-onclick-methods
    */ 
    const renderCard = (card, index) => {
        return (                
            <img className="pCard" src={card.Image} onClick={() => history.push('/programdetails', {Uid: card.Uid})}/>                      
        ); 
    }; 
    return (
        <div className="grid">
            {programs && programs.map(renderCard)}       
        </div>
        ); 
}; 

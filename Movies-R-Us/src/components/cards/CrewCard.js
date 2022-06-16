/**
 * Crew Card 
 *  * Shows each crew member as a card component 
 */
import React from 'react'
import {Card} from 'react-bootstrap'
import {useHistory} from 'react-router-dom';
import './Card.css'

export default function CrewCard({programCrew}){
    let history = useHistory();

    /**
     * Rendering each crew member in the list of crew members each as an individual card component
     * References: 
     *  * To create individual cards: https://react-bootstrap.github.io/components/cards/ 
     *  * To populate each card with information from card content object: 
     *      * Dynamically Create Cards In ReactJS Using React-Bootstrap https://www.youtube.com/watch?v=IhWFs0diAPE
     */
    const renderCard = (card, index) => {
        return (
            <Card style={{ width: '11rem'}} key={index} className="cCard">
                <Card.Img variant="top" src={card.Image} style={{height: "200px"}} onClick={() => history.push('/crewdetails', {Cid: card.Cid})}/>
                <Card.Body onClick={() => history.push('/crewdetails', {Cid: card.Cid})}>
                    <Card.Text style={{height: '0rem', marginLeft:'-10px'}} className="cardTitle">{card.Name}</Card.Text>
                </Card.Body>
            </Card>
        ); 
    }; 
    return <div className="grid">{programCrew && programCrew.map(renderCard)}</div>; 
}; 

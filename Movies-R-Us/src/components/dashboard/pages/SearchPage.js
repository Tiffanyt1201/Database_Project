/**
 * Search Page: 
 *  * Shows all the results found from a user search 
 */
import React, {useState, useEffect} from 'react'
import Dashboard from '../Dashboard'
import styled from 'styled-components'
import ProgramCard from '../../cards/ProgramCard'
import CrewCard from '../../cards/CrewCard'

export default function SearchPage(props) {
    var input = props.location.state['Input']
    input = input.toLowerCase()
    input = input.trim()

    console.log(input)
    var programsMatched = [] 
    var crewMatched = []

    const [programs, setPrograms] = useState([]);
    const [crew, setCrew] = useState([]);

    // API call to get a list of ALL programs that exist in the database 
    useEffect(() => {
        fetch(`/allprograms`).then(response =>
            response.json()).then(data => {
                setPrograms([...data['movies'], ...data['tvshows']]);
            });
    }, []);

    // API call to get a list of ALL crew members that exist in the data base 
    useEffect(() => {
        fetch(`/allcrew`).then(response =>
            response.json()).then(data => {
                setCrew(data);
            });
    }, []);

    // Searching through and checking if the user input in the search bar is of program(s) that exist in the database 
    for (var i=0; i<programs.length; i++){
        if(input === (programs[i]['Name']).toLowerCase() || (programs[i]['Name']).toLowerCase().includes(input)){
            programsMatched.push({Uid: programs[i]['Uid'], Image: programs[i]['Image']})
        }
    }

    // Searching through and checking if the user input in the search bar is of crew member(s) that exist in the database
    for (var i=0; i<crew.length; i++){
        if(input === (crew[i]['Name']).toLowerCase() || (crew[i]['Name']).toLowerCase().includes(input)){
            crewMatched.push({Cid: crew[i]['Cid'], Image: crew[i]['Image'], Name: crew[i]['Name']})
        }
    }

    // Checking if no search results were found and display "No results matching" message 
    if (programsMatched.length === 0 && crewMatched.length === 0){
        return (
            <>
            <Dashboard/>
            <Header>
                <h1>Search Results: No results matching </h1>
            </Header>
            </>
        )
    }
    // Checking if the search result found is of crew members and display all crew members as card components on the page 
    else if (programsMatched.length === 0 && crewMatched.length !== 0){
        return (
            <>
            <Dashboard/>
            <Header>
                <h1>Search Results: {input} </h1>
            </Header>
            <CrewCard programCrew={crewMatched}/>
            </>
        )
    }
    // Checking if the search result found is of programs and display all programs as card components on the page 
    else {
        return (
            <>
            <Dashboard/>
            <Header>
                <h1>Search Results: {input}</h1>
            </Header>
            <ProgramCard programs={programsMatched}/>
            </>
        )

    }
}

/**
 * Search page UI styling 
 */
const Header = styled.div`
    margin-left: 240px; 
    margin-top: 70px;
`
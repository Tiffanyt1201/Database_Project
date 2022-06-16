/**
 * Dashboard 
 *  * Shows the top navigation bar along with the side bar 
 */
import React, { useState, useRef } from 'react'
import { Nav, Navbar, Form, Alert } from 'react-bootstrap'
import { useAuth } from "../../contexts/AuthContext"
import { Link, useHistory } from "react-router-dom"
import {Menu, Button, Divider } from 'semantic-ui-react'
import styled from 'styled-components'

import SideBarItem from "./SideBarItem"

export default function Dashboard() {
    const [error, setError] = useState("")
    const { currentUser, logout } = useAuth()
    const history = useHistory()
    const searchRef = useRef()

    /**
     * Handling the click event of the Logout button 
     */
    async function handleLogout() {
        setError('')

        try {
            await logout()
            history.pushState('/login')
        } catch {
            setError('Failed to log out')
        }
    }

    /**
     * Handles the submit event of the search bar on the tap navigation bar. That is, whenever the user types in the search bar 
     * and hits the enter key, the user will be redirected to the search results page 
     */
    async function handleSubmit(e) {
        if(e.key === 'Enter'){
            e.preventDefault()   
            console.log(searchRef.current.value)
            history.push('/search-page', {Input: searchRef.current.value})

        }
        
    }

    /**
     * Dashboard UI 
     */
    return (
        <Container>
            <Header>
                {error && <Alert variant="danger">{error}</Alert>}
                <Navbar expand="lg">
                    <Navbar.Brand href="/">MOVIESRUS</Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Form className="form-search" onSubmit={handleSubmit}>
                        <Form.Control icon="search" placeholder="Search..." onKeyPress={handleSubmit} ref={searchRef} required/>
                    </Form>
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="ml-auto">
                            <ProfileLink>
                                <Nav.Item><Link to="/profile">Profile</Link></Nav.Item>
                            </ProfileLink>
                            <Nav.Item>
                                <Button primary class="logoutBtn" variant="link" onClick={handleLogout}>Logout</Button>
                            </Nav.Item>
                        </Nav>
                    </Navbar.Collapse>
                </Navbar>
            </Header>
            <StyledSideNav>
                <Menu borderless vertical stackable fixed="left" className="side-nav">
                    <SideBarItem path='/' label='Home' icon='home' />
                    <SideBarItem path='/movies' label='Movies' icon='film' />
                    <SideBarItem path='/tvshows' label='Television' icon='tv' />
                    <SideBarItem path='/schedule' label='Schedule' icon='calendar alternate outline' />
                    <Divider />
                    <SidebarHeader>Library</SidebarHeader>
                    <SideBarItem path='favourites' label='Favourites' icon='favorite' />
                    <Divider />
                    <SideBarItem path='/subscriptions' label='Subscriptions' icon='shopping cart' />
                    <Divider />
                </Menu>
            </StyledSideNav>
        </Container>
    )
}

/**
 * Dashboard UI styling 
 */
const Container = styled.div``;

const Header = styled.div`
    .navbar { 
    background-color: #222; 
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1;
    }
    .navbar-brand {
        font-size: 1.4em;
        color: #9FFFCB;
        margin-left: 40px;
        font-weight: bold;
        &:hover { color: white; }
    }
    .form-search {
        position: absolute !important;
        left: 15%;
        right: 55%;
        
    }
`;

const StyledSideNav = styled.div`
    position: fixed;     
    height: 100%;
    width: 220px;     
    z-index: 1;      
    top: 3.4em;      
    background-color: #222; 
    overflow-x: hidden;     
    padding-top: 10px;

    .ui.menu.fixed.side-nav {
        background-color: #f5f5f5;
        margin-left: 10px;
        margin-top: 50px;
        overflow-y: auto;
        padding-bottom: 64px;

        .sidebar-item:hover {
            background: #ebebeb;
            }
        }

        .side-nav.ui.vertical.menu {
            width: 200px;
        }
`;

const SidebarHeader = styled.text`
    font-size: 20px;
    font-weight: bold;
    padding-left: 5px;
`;

const ProfileLink = styled.text`
    padding: 10px 10px 0 0;
`; 
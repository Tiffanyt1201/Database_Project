/**
 * Side Bar 
 *  * The side bar that is displayed in the web application. The user can use this to access different pages of the system 
 *    This includes the "Home", "Movie", "Television", "Schedule", "Favourites", and "Subscriptions" pages 
 */
import React from 'react'
import { Link, withRouter } from 'react-router-dom';
import { Icon, Menu } from "semantic-ui-react"
import styled from 'styled-components';

export class SideBarItem extends React.Component {
    render() {
        const highlight = this.shouldBeHighlighted() ? 'highlight-item' : null;
        return (
            <SideMenu>
                <Link to={{ pathname: this.props.path }}>
                    <Menu.Item className={['sidebar-item', highlight].join(' ')}>
                        <Row>
                            <span><Icon size='large' name={this.props.icon} /></span>
                            <span>{this.props.label}</span>
                        </Row>
                    </Menu.Item>
                </Link>
            </SideMenu>
        );
    }

    // Highlights which ever side bar tab the user selected and is on 
    shouldBeHighlighted() {
        const { pathname } = this.props.location;
        if (this.props.path === '/') {
            return pathname === this.props.path;
        }
        return pathname.includes(this.props.path);
    }
}
export default withRouter(SideBarItem);

/**
 * Side bar UI styling 
 */
const SideMenu = styled.div`
    background: #f5f5f5;
    span {
        i.icon {
            margin-right: 20px;
            color: #888888;
        }
    }
    .sidebar-item{
        &.highlight-item {
            span {
                font-weight: 600;
            }
            i.icon {
                color: #ff0002;
            }
        }
    }
`;

const Row = styled.div`
    display: flex;
    align-items: center;
`;
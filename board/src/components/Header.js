import React, {Component } from 'react';
import { Link, BrowserRouter as Router, Route} from 'react-router-dom';
import '../css/Header.css';
import WriteForm from './WriteForm';

class Header extends Component {
    render() {
        return(
            <Router>
                <div>
                    <div className="logo">
                        업무일지
                    </div>
                    <div className="menu">
                        <Link to="/WriteForm"><div className="menu-item">작성하기</div></Link>
                    </div>
                </div>

                <div className="content2">
                    <div className="content">
                        <Route exact path="/WriteForm" component={WriteForm} />
                    </div>
                </div>
            </Router>
        )
    }
}
export default Header;
import React, { Component} from 'react';
import "ka-table/style.css";
import "../css/Board.css";
import moment from 'moment';  // 날짜 타입
import { ITableProps, kaReducer, Table } from "ka-table";
import { hideDetailsRow, showDetailsRow } from "ka-table/actionCreators";
import '../css/App.css';
import {BrowserRouter as Router} from 'react-router-dom';
import BoardList from './BoardList';
import { json } from 'body-parser';
import MainList from './MainList';
import { BrowserRouter, Route, Switch } from 'react-router-dom'; 


class yejinComponent extends Component {


    render(){
        const { params } = this.props.match;
  
        return (
           
            <div>
                {
                    (params.cnt) === "0"
                    ? alert("삭제실패")
                    : (params.cnt) === "1"
                        ? alert("삭제성공")
                        : <b></b>
                }

                <MainList cnt={params.cnt} deptName={params.deptName}/>
                
            </div>
    
            
        //     <BrowserRouter>
        //     <div className="App">
        //        <Switch> 
                   
        //             <Route exact path='/MainList/{params.deptName}/{params.cnt}' component={MainList } ></Route>             {/* 게시판 리스트 조회 - 설예진 */}
        //         </Switch>
        //     </div>  
        //   </BrowserRouter>

        )
    }

}

export default yejinComponent;





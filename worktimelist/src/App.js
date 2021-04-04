import './css/App.css';
import './css/Board.css';
import WorkTimeList from './components/WorkTimeList';
import HolidayMain from './components/HolidayMain';
import React from 'react';
import { BrowserRouter, Router, Route, Switch } from 'react-router-dom'; 
import BoardMain from './components/BoardMain';
import PCardMain from './components/PCardMain';
import Record from './components/Record';
import RecordWrite from './components/RecordWrite';
import ReqModify from './components/ReqModify';
import Hall from './components/Hall';
import MainList from './components/MainList';
import BoardInput from './components/BoardInput';
import yejinComponent from './components/yejinComponent';



function App() {
  return (
  <BrowserRouter>
      <div className="App">
         <Switch> 
              <Route exact path="/ReqModify"    component={ ReqModify }></Route>      {/* 근무 변경 신청하기 - 이철한 */}
              <Route exact path="/WorkTimeList" component={ WorkTimeList } ></Route>  {/* 근태 리스트 조회   - 이철한 */}
              <Route exact path="/HolidayMain"  component={ HolidayMain } ></Route>   {/* 휴무 리스트 조회   - 설예진 */}
              <Route exact path='/yejinComponent/:deptName/:cnt' component={yejinComponent } ></Route>             {/* 게시판 리스트 조회 - 설예진 */}
              <Route exact path="/BoardInput/:deptCode/:empCode" component={BoardInput} ></Route>           {/* 게시판 쓰기   - 설예진 */}
              <Route exact path="/PcardMain"    component={ PCardMain } ></Route>     {/* 직원복지 리스트 조회 -박상원 */}
              <Route exact path="/Record"       component={ Record } ></Route>        {/* 업무일지 조회 - 박성언 */}
              <Route exact path="/RecordWrite"  component={ RecordWrite } ></Route>   {/* 업무일지 작성 - 박성언 */}
              <Route exact path="/Hall"         component={ Hall }></Route>           {/* 연회장 조회   - 김석원 */}
              


          </Switch>
      </div>  
    </BrowserRouter>
  );
}

export default App;










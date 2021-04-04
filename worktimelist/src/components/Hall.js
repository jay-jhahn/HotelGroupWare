import React, { Component } from 'react';
import '../css/App.css';
import "ka-table/style.css";
import "../css/Hall.css";
import { BrowserRouter as Router } from 'react-router-dom';
import HallList from "./HallList";

class Hall extends Component {
    // callApi : fetch()를 통해 select -> response -> componentDidMount() res 
    // -> setState(board) -> state.board가 수정 -> BoardList에 props 형태로 전달
    state = {
        hall: ''
    }

    // 생명주기
    /*
    componentDidAmont() 메서드 : 컴포넌트가 마운트 된 직후 호출되며, 데이터로딩과 같은 작업 등에 재정의
    예 ) List에 특정 item들을 출력하고자 할때 item에 들어갈 Data가 Server에 존재한다면 Server에서 읽어와서
    item 데이터가 state에 존재시 이 state에 데이터를 setting하는 작업
    마운트 즉 React 컴포넌트가 실제 DOM에 삽입된 후 서버로부터 데이터를 읽어와서 setState후 화면에 rerendering
    */

    componentDidMount() {
        this.callApi()
            .then(res => this.setState({ hall: res }))    // arrow function : 화살표 함수 : 변수를 전달하면서 기능구현
            .catch(err => console.log(err));
    }

    /*
        async/await는 Promise를 더욱 쉽게 사용할 수 있도록 해주는 ESB 문법이다.
        이 문법을 사용하기 위해서 함수의 앞부분에 async 키워드를 추가하고,
        해당 함수 내부에서 promise의 앞부분에 await 키워드를 사용한다.
        이렇게 하면 promise가 끝날때까지 기다리고, 결과값을 특정 변수에 담을 수 있다.
        Promise는 콜백지옥 같은 코드가 형성되지 않게 하는 방안으로서 ES6에 도입된 기능이다.

        function increase(number) {
            const promise = new Promise((resolve. reject) => {
                .....
                async function runTasks(){

                }
            })
        }
    */

    callApi = async () => {
        const response = await fetch('/api/HallList');     // await fetch('url')로 json 형식으로 가져온 리스트(boardList)를 받아와서 response에 담는다.
        const body = await response.json();
        return body;
    }

    render() {
        return (
            <Router>
                <div class="ka">
                    <div class="ka-table-wrapper">
                        <table class="ka-table">
                            <thead class="ka-thead">
                                <tr class="ka-tr ka-thead-row">
                                    <th class="ka-thead-cell ka-thead-background " scope="col" colSpan="5">
                                        <div class="ka-thead-cell-wrapper">
                                            <div class="ka-thead-cell-content-wrapper">
                                                <div class="ka-thead-cell-content" className="Center">연회장 예약</div>
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                            </thead>

                            {this.state.hall ? this.state.hall.map((b, index) => {
                                return <HallList key={index} resCode={b.RESCODE} hallCode={b.HALLCODE}
                                roomNum={b.ROOMNUM} empCode={b.EMPCODE} guestCode={b.GUESTCODE}
                                resCount={b.RESCOUNT} resDate={b.RESDATE} checkIn={b.CHECKIN}
                                checkOut={b.CHECKOUT} eventTitle={b.EVENTTITLE} eventDate={b.EVENTDATE}
                                eventMenu={b.EVENTMENU} eventTableSet={b.EVENTTABLESET} eventNotes={b.EVENTNOTES}
                                eventCake={b.EVENTCAKE} eventFlower={b.EVENTFLOWER} resKind={b.RESKIND}
                                resState={b.RESSTATE} eventIce={b.EVENTICE} eventMist={b.EVENTMIST}
                                eventMenu1={b.EVENTMENU1} guestName={b.GUESTNAME} eventSahang={b.EVENTSAHANG}
                                 />
                            }) : ''
                            }
                        </table>
                    </div>
                </div>
            </Router>
        )
    }
}
export default Hall;
import PCardList from './PCardList';
import React, { Component } from 'react';
import '../css/PCardMain.css';
import PClock from './PClock';

class PCardMain extends Component {
  state = {
    events: '',
  }
   /*========== 라이프 사이클 ==========*/
    componentDidMount() {// 컴포넌트 마운트 직후 데이터 재정의
        this.callApi()
            .then(res => this.setState({events: res})) // response 값을 res로 받아서 events에 넣기. setState로 위에 state의 events 값  변경
            .catch(err => console.log(err));
        
    }
    /*========== 비동기 방식으로 콜백 ==========*/
    callApi = async () => {
      const response = await fetch('/api/PCardList'); // await fetch('url')로 json 형식으로 가져온 리스트(PCardList)를 받아와서 response에 담는다. 실제 db 결과. componentDidMount()의 res로 넘어간다.
      const body = await response.json();
      return body; // 나중에 사용됨
  }
  
  render(){
    return (
      <div className="App">
        <PClock/>
        {this.state.events ? <PCardList events={this.state.events}/>:''}
      </div>
    );
  }
}

export default PCardMain;
